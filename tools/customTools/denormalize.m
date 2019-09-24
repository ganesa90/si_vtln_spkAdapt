function vect = denormalize(data,std_frac,pn)
if nargin < 2
    error('Atleast two arguments should be there... type ');
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
    data_denorm(iter,:)=(std_dat(iter)*(data(iter,:)/std_frac))+mean_dat(iter);
    vect(iter,:) = data_denorm(iter,:);
    %vect(iter,:) = meanfilt(data_norm(iter,:),2*ord+1);
end