function [X,Y] = dibuja_cuatro(x,y)

P=[x',y'];

% Rotaciones
A = [-1 0;0 1]; B = -A;

P=[P;P*A];
P=[P;P*B];


X=P(:,1);
Y=P(:,2);
%plot(X,Y,'*')