function [X,Y] = recta_pixel(x1,y1,x2,y2)
% Algoritmo de Bresenham
dx = abs(x2 - x1);
dy = abs(y2 - y1);
steep = dy <  dx;

if x2 < x1  sx=-1; else  sx=1;end
if y2 < y1  sy=-1; else  sy=1;end
%dx=abs(dx);dy=abs(dy);
x=x1; y=y1;
X=x;Y=y;

if steep
    d = dx-2*dy;
    IncE = 2*dy;
    IncNE = (2*dx - 2*dy);

    while x ~= x2
        if d < 0
            d=d+IncNE;
            y=y+sy;
        else
            d=d-IncE;
        end
        x=x+sx;
    
    X=[X;x];
    Y=[Y;y];
    
    end    
else
    t=dx;dx=dy;dy=t;
    d = dx-2*dy;
    IncE = 2*dy;
    IncNE = (2*dx - 2*dy);
    
   
    while y ~= y2
        if d < 0
            d=d+IncNE;
            x=x+sx;
        else
            d=d-IncE;
        end
        
        y=y+sy;
        
    X=[X;x];
    Y=[Y;y];
    
    end    
    
end




end


