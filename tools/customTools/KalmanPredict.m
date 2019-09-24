%Kalman Filter  Prediction  step

%   [X,P] = KF_PREDICT(X,P,A,B,D,Q,U)
 
% Description:
%   Perform Kalman Filter prediction step. The model is
%
%     x[k] = A*x[k-1]  + Bw[k-1],  w ~ N(0,Q).
%     y[k] = C*x[k]   + v[k]                 v ~ N(0,R)


function [x,P] = KalmanPredict(x,P,A,B,Q)

    x = A * x;
    P = A * P * A' + B * Q * B';
 
