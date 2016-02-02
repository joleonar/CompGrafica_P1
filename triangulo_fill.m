function [Xr,Yr] = triangulo_fill(X,Y) 

Tr=[X Y];
[A,ITr]=sort(Tr(:,2),'descend');
Trs=Tr(ITr,:);
y=Trs(1,2);
Vx=Trs(1,1);
Pr=[];
for i=2:length(Trs)
   if Trs(i,2)==y
       Vx=[Vx;Trs(i,1)];
   else
       [Pxr Pyr]=HorizLine(min(Vx),y,max(Vx));
       Vx=Trs(i,1);
       y=Trs(i,2);
       Pr=[Pr;[Pxr Pyr]];
   end
  
end

Xr=Pr(:,1);
Yr=Pr(:,2);