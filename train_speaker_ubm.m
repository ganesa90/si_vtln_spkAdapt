function train_speaker_ubm()
addpath('tools/voicebox');
addpath('tools/customTools');
addpath('tools/MSR_identity_toolkit/code/')
DATADIR = 'data/XRMB_database/'
featDIR = [DATADIR 'XRMB_htkMFCC39_usable/'];
flist_DIR = [DATADIR 'sd_filelists/'];
opDIR = 'speaker_ubms/';
nmix = 64;
final_niter = 20;
ds_factor = 1;
nworkers = 1;
spklist = textread('./sd_expt_speakerList.lst','%s');
for i = 1:length(spklist)
    spk_id = spklist{i};
    flist = textread([flist_DIR 'filelist_' spk_id '_train.lst'],'%s');
    gmmFilename = ['gmm_ubm_' spk_id];
    gmmFilename = [opDIR gmmFilename '_' num2str(nmix)];
    fprintf('Training UBM for speaker %s\n',spk_id);
    gmm_em(flist, featDIR, nmix, final_niter, ds_factor, nworkers, gmmFilename)
end

