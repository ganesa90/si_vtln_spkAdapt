function [out] = threshold(input,MAX,MIN)
%=========================================================================
% Function to threshold the Features and targets for Speech Inversion
% Usage:        threshold(input,MAX,MIN)
% Inputs:       input:  input vector/matrix to be thresholded
%               MAX:    Upper limit of threshold
%               MIN:    Lower limit of threshold
% Outputs:      out:    Thresholded output vector/matrix
% Description:  
% Author:       Ganesh Sivaraman
% Date Created: 03/27/2013
% Date Modified:
%=========================================================================
mask_max = ~(input > MAX);
mask_min = ~(input < MIN);
out = mask_max.*input + ~mask_max*MAX;
out = mask_min.*out + ~mask_min*MIN;