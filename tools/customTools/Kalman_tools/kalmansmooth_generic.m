function tst_trg_rcn_sm = kalmansmooth_generic(tst_trg_rcn,R)
% function that performs Kalman smoothing on input data
data_sm = [];
for iter1 = 1:size(tst_trg_rcn,1)
    EstdData = tst_trg_rcn(iter1,:);
    %R = 0.25; %Change R value, The Bigger R, The more smoothed data
    Q = 300;
    T = 0.1;
    A = [1 T;0 1];B = [(T^2)/2;T];C = [1 0];
    P0= eye(2) ;  x0= [EstdData(1);0];
    x = x0 ; P = P0;
    [MMf,MMp,PPf,PPp]=KalmanLoop(x,P,A,B,C,EstdData,Q,R);
    [MMs,PPs]=KalmanRTSSmoother(MMf,MMp,PPf,PPp,A);
    data_sm = [data_sm; MMs(1,:)];
end
tst_trg_rcn_sm = data_sm;