function vect = mv_normalize(data,std_frac,pn)
% 
% function usegae --
% vect = mva(data,0.2,3)
% 
% function takes the following input 
%          data : a PxQ feature matrix where P is the dimension of the 
%                    feature and Q is the number of sample points
%          std_frac: the fraction of the true std that the normalized data
%                    should have, for example if the normalized data should
%                    have unity std, then std_frac should be 1.
%          ord: provides the order of the ARMA filtering - Removed in
%          modification
%          pn : optional structure containing the mean and standard-dev
%               Only used while global mean and standard-dev is used
%               when this structure is not provided ... it computes the
%               mean and the standard-dev on a per file basis.
%
% the outputs are - 
%          vect: a matrix of same order as data but with zero mean
%                    and std normalized as suggested by std_frac and
%                    smoothed by ARMA filtering
%
% Code: written by V. Mitra
%       06.10.2010 -- Ver 1.0.
%       function created for the natural XRMB TV estimator
% Modified by: Ganesh Sivaraman
%       03.22.2013
%       Modified to remove the ARMA filtering
% ======================================================================
%
if nargin < 2
    error('Atleast two arguments should be there... type >> help mva');
end
%
if nargin < 3
    mean_dat = mean(data');
    std_dat  = std(data');
else % if the mean and standard-dev is provided
    mean_dat = pn.mean_G;
    std_dat  = pn.std_G;
end    
[row,col]=size(data);
for iter = 1:row
    data_norm(iter,:)=std_frac*(data(iter,:)-mean_dat(iter))/std_dat(iter);
    vect(iter,:) = data_norm(iter,:);
    %vect(iter,:) = meanfilt(data_norm(iter,:),2*ord+1);
end
%