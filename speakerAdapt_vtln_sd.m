function speakerAdapt_vtln_sd()
addpath('tools/voicebox');
addpath('tools/customTools');
addpath('tools/MSR_identity_toolkit/code/');
spklist = textread('sd_expt_speakerList.lst','%s');
flistDIR = 'data/XRMB_database/sd_filelists/';
DATADIR = 'data/XRMB_database/XRMB_htkMFCC39_usable_vtln/';
test_spklist = textread('./sd_expt_speakerList.lst','%s');
for iter1 = 1:length(spklist)
% Creating a new subdirectory under XRMB_htkMFCC39_usable_vtln for every target speaker.
% Each folder witll contian the MFCC fetaures for all the other speaker VTLN transformed to the target speaker.
if ~exist([DATADIR spklist{iter1} '_complete'],'dir')
    mkdir([DATADIR spklist{iter1} '_complete']);
end
targ_spk = spklist{iter1};
load(['speaker_ubms/gmm_ubm_' spklist{iter1} '_64.mat']);
for iter2 = 1:length(test_spklist)
    log_llk = [];
    if iter2 == iter1
        continue; % We do not want to do VTLN warping for the same speaker as target speaker.
    end
    % Doing a grid search on the VTLN warping factor.
    for w = 0.8:0.025:1.2
        warpfac = get_warpfac_str(w);
        spk = test_spklist{iter2};
        % This HTK command extracts the MFCC+delta+delta-delta features with VTLN warping.
	% Needs the .scp file for creating the features in batch. Look at the sample scp files for example
        cmd = ['HCopy -T 0 -C ' './config/mfcc39_vtln_' warpfac '.conf' ' -S data/XRMB_database/scp_lists/htkMFCC39_' spk '_test.scp'];
        system(cmd);
        flist = textread([flistDIR 'filelist_' spk '.lst'],'%s');
        data = [];
        for iter3 = 1:length(flist)
            fname = flist{iter3};
            feats = readhtk([DATADIR fname '.htk']);
            data = [data feats'];
        end
        [post llk] = postprob(data, gmm.mu, gmm.sigma, gmm.w');
        log_llk = [log_llk sum(llk)];
    end
    % Finding the warping factor that maximizes the log-likelihood in the target speaker's acoustic space
    [maxllk ind] = max(log_llk);
    w = 0.8:0.025:1.2;
    best_warp = w(ind);
    display(spk);
    display(best_warp);
    display(maxllk);
    best_warp_str = get_warpfac_str(best_warp);
    % Extracting the VTLN transformed features for the best warp factor.
    cmd = ['HCopy -T 0 -C ' './config/mfcc39_vtln_' best_warp_str '.conf' ' -S ./scp_lists/htkMFCC39_' spk '.scp'];
    system(cmd);
    cmd = ['mv -f ' DATADIR 'G_' spk '*.htk ' DATADIR targ_spk '_complete'];
    system(cmd);    
end
end
end

function [wstr] = get_warpfac_str(w)
    warpfac = num2str(w);
    wstr = warpfac;
    if length(warpfac) == 3
        wstr = [warpfac '00'];
    elseif length(warpfac) == 4
        wstr = [warpfac '0'];
    elseif w == 1
        wstr = '1.000';
    end
end            
                

