function [X,Y]=dibuja_ochoR(x,y)  
P=[x,y];

% Rotaciones
A=[0 1;1 0]; B=[1 0;0 -1]; C=-B;

P=[P;P*A];
P=[P;P*B];
%P=[P;P*C];

[PC,Pi] = unique(P(:,2));
Pi = sort(Pi);
PP = P(Pi,:);
P=[P;P*C];
Xr=[];Yr=[];
for i=1:length(PP)
   if PP(i,1) ~=0
    [Hx,Hy] =  HorizLine(-PP(i,1)+1,PP(i,2),PP(i,1)-1);
   Xr=[Xr;Hx];
   Yr=[Yr;Hy];
   end
   
end

X=P(:,1);
Y=P(:,2);
X=[X;Xr];
Y=[Y;Yr];