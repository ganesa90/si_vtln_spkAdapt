function [x,x2,N] = getmoment(data)
% 
% function usegae --
% vect = getmoment(data)
% 
% function takes the following input 
%          data : a PxQ feature matrix where P is the dimension of the 
%                    feature and Q is the number of sample points
%
% the outputs are - 
%          x : a vector containing sum(data)
%          x2: a vector containing sum(data.^2)
%          N : Total Number of datapoints
%
% Code: written by V. Mitra
%       07.17.2010 -- Ver 1.0.
%       function created for the natural XRMB TV estimator
% ======================================================================
%
x  = sum(data,2);
x2 = sum(data.^2,2);
N  = size(data,2);
%