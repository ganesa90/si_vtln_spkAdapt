% Kalman Filter update step
%

%   [X,P,S] = KF_UPDATE(X,P,m,C,R)
%
% Description:
%   Perform Kalman Filter prediction step. The model is
%
%     x[k] = A*x[k-1]  + Bw[k-1],  w ~ N(0,Q).
%     y[k] = C*x[k]   + v[k]                 v ~ N(0,R)



function [X,P] = KalmanUpdate(X,P,m,C,R)

% update step
z = C * X;             % Mesurament prediction
v = m - z;             % Innovation
S = C * P * C' + R;    % innovation Covar
K = P * C' * inv(S);   % Kalman Gain

X = X + K * v;
P = P - K * S * K';

