function [Xr,Yr] = circulo_pixel(xc,yc,r,rell)
x=0;y=r;
X=x;Y=y;

%p=5/4-r;
p=1-r;

while x < y
    if p < 0
        p = p+2*x+3;
        x = x+1; y = y;
        X = [X; x];
        Y = [Y; y];
        
    else
        p = p+2*x-2*y+5;
        x = x+1; y = y-1;
        X = [X;x];
        Y = [Y;y];
        
    end
    
end

if rell==0
    [Xr,Yr] = dibuja_ocho(X,Y);
else 
    [Xr,Yr]=dibuja_ochoR(X,Y);
end

Xr=Xr+xc;Yr=Yr+yc;
%plot(Xr,Yr,'*')
%axis('square')
