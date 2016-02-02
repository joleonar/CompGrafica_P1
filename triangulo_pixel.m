function [X,Y] = triangulo_pixel(x1,y1,x2,y2,x3,y3,rell)

%x1 =  1; y1 = 20; 
%x2 = 40; y2 = 30;
%x3 = 50; y3 =  1;

% Ordena los puntos en eje y
P = [x1 y1; x2 y2; x3 y3];
[A,IX] = sort(P,1,'descend');
Ps = P(IX(:,2),:);

x1=Ps(1,1); y1=Ps(1,2);
x2=Ps(2,1); y2=Ps(2,2);
x3=Ps(3,1); y3=Ps(3,2);

% Aplica Bresenham para calcular los lados del triangulo
[Rx1,Ry1] = recta_pixel(x1,y1,x2,y2);
[Rx2,Ry2] = recta_pixel(x1,y1,x3,y3);
[Rx3,Ry3] = recta_pixel(x2,y2,x3,y3);

X = [Rx1;Rx2;Rx3];
Y = [Ry1;Ry2;Ry3];

if rell==1
    [Xr,Yr]=triangulo_fill(X,Y);

    X=[X;Xr];
    Y=[Y;Yr];
    
end

%plot(X,Y,'*')
%axis([1,100,1,100])