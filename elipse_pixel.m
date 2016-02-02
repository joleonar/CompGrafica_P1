function [Xe,Ye] = elipse_pixel(xc,yc,a,b,rell)

% Modalidad 1
x = 0; y = b;
X = x; Y = y;
d = b*(4*b-4*a*a)+a*a;

while 2*b^2*(x+1) < a^2*(2*y-1)
    if d < 0
        d = d + 4*b^2*(2*x+3);
    else
        d = d + 4*(b^2*(2*x+3) + a^2*(-2*y+2));
        y=y-1;
    end
    x = x + 1;
    
    X=[X,x];
    Y=[Y,y];
        
end
% Modalidad 2

d = b^2*(4*x^2+4*x+1) + a^2*(4*y^2-8*y+4) - 4*a^2*b^2;
while y > 0
    
   if d < 0
       d = d +4*(b^2*(2*x+2) + a^2*(-2*y+3));
       x = x+1;
       
   else
       d = d+4*a^2*(-2*y+3);
   end
   y = y-1;
   
   X = [X,x];
   Y = [Y,y];
end
if rell==0
    [Xe,Ye] = dibuja_cuatro(X,Y);
else
    [Xe,Ye] = dibuja_cuatroR(X,Y);
end
%plot(Xe,Ye,'*')
Xe = Xe + xc;
Ye = Ye + yc;