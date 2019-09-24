function [MMf,MMp,PPf,PPp]=KalmanLoop(x,P,A,B,C,Y,Q,R)


N=length(Y);%Number of Measurements

MMf = zeros(2,N);
PPf = cell(1,N);
MMp = zeros(2,N);
PPp = cell(1,N);
% Perform prediction

for i=1:N
    [x,P] = KalmanPredict(x,P,A,B,Q);
    MMp(:,i) = x;
    PPp{i} = P;
    [x,P] = KalmanUpdate(x,P,Y(i),C,R);
    MMf(:,i) = x;
    PPf{i} = P;
end






