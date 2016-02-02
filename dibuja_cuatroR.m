function [X,Y] = dibuja_cuatroR(x,y)

P=[x',y'];

% Rotaciones
A = [1 0;0 -1]; B = -A;

P=[P;P*A];
[PC,Pi] = unique(P(:,2));
Pi = sort(Pi);
PP = P(Pi,:);
P=[P;P*B];
Xr=[];Yr=[];
for i=1:length(PP)
   if PP(i,1) ~= 0
    [Hx,Hy] =  HorizLine(-PP(i,1)+1,PP(i,2),PP(i,1)-1);
   Xr=[Xr;Hx];
   Yr=[Yr;Hy];
   end
   
end

P=[P;P*B];


X=P(:,1);
Y=P(:,2);

X=[X;Xr];
Y=[Y;Yr];
%plot(X,Y,'*')