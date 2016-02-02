function [X,Y]=dibuja_ocho(x,y)  
P=[x,y];

% Rotaciones
A=[0 1;1 0]; B=[-1 0;0 1]; C=-B;

P=[P;P*A];
P=[P;P*B];
P=[P;P*C];

X=P(:,1);
Y=P(:,2);
