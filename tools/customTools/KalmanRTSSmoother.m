% Description:
%   Perform Kalman Filter prediction step. The model is
%
%     x[k] = A*x[k-1] + Bw[k-1],  w ~ N(0,Q).
%     y[k] = C*x[k]   + v[k]      v ~ N(0,R)

%Example
% Y is measurement
% x=x0
% P=P0;
% [MMf,MMp,PPf,PPp]=KalmanLoop(x,P,A,B,Y,Q,R,D,u)
% [MMs,PPs]=KalmanRTSSmoother(MMf,MMp,PPf,PPp,A)

function [MMs,PPs]=KalmanRTSSmoother(MMf,MMp,PPf,PPp,A)

N=size(MMf,2);
N1=size(MMf,1);
MMs=zeros(N1,N);
MMs(:,end)=MMf(:,end);
PPs=cell(1,N);
PPs{N}=PPf{end};
Xs=MMf(:,end);
Ps=PPf{end};
for i=N-1:-1:1
    Xf=MMf(:,i); % forwardan gelen filtered deger
    Pf=PPf{i};   % forwardan gelen filtered deger

    Xp=MMp(:,i+1);   % forwarla bir sonraki zamandan predicted deger
    Pp=PPp{i+1};  % forwarla bir sonraki zamandan predicted deger

    J=Pf*A'*inv(Pp);
    Xs=Xf+J*(Xs-Xp);
    Ps=Pf+J*(Ps-Pp)*J';

    MMs(:,i)=Xs;
    PPs{i}=Ps;
end


