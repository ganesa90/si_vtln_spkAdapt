function [data_norm stats] = normalize_stats(data,std_frac,stats)
% 
% function usegae --
% [data_norm stats] = normalize_stats(data,0.2)
% 
% function takes the following input 
%          data : a PxQ feature matrix where P is the dimension of the 
%                    feature and Q is the number of sample points
%          std_frac: the fraction of the true std that the normalized data
%                    should have, for example if the normalized data should
%                    have unity std, then std_frac should be 1.
%          stats: if provided it uses the structure stats to apply the
%                    normalization process
%
% the outputs are - 
%          data_norm: a matrix of same order as data but with zero mean
%                    and std normalized as suggested by std_frac
%          stats: the mean and the std vector of the original data
%                 matrix, data
%
% Code: written by V. Mitra
%       1.2.2009 -- Ver 1.0.
%       Part of Distal Learning Algo
% ======================================================================
%
if nargin < 3
    flg = 1;
else
    flg = 2;
end
%
if flg == 1
     	mean_dat = mean(data');
     	std_dat  = std(data');
     	[row,col]=size(data);
     	for iter = 1:row
            data_norm(iter,:)=std_frac*(data(iter,:)-mean_dat(iter))/std_dat(iter);
     	end
     	stats.mean_dat = mean_dat;
     	stats.std_dat = std_dat;
     	stats.std_frac = std_frac;
elseif flg == 2
    	mean_dat = stats.mean_dat;
    	std_dat = stats.std_dat;
    	std_frac = stats.std_frac;
       [row,col]=size(data);
    	for iter = 1:row
        data_norm(iter,:)=std_frac*(data(iter,:)-mean_dat(iter))/std_dat(iter);
    	end
end