function primitiva = grafica_primitivas(curva,rell,np)
% Grafica de curvas primitivas
%curva = '        % Opciones:linea, circulo, elipse, triangulo, beizer
%rell = 0;        % Relleno Si = 1; No = 0; 
%persistent n
m=256;               % Tamano del grafico (dimensión matriz)


% if isempty(n)
%     n = 1;
% else
%     n=n+1;
% end
% nprim=n;

%fh=findall(0,'type','figure');  % Verifica si existe el objeto figura

%if isempty(fh)
%    display_curvas(zeros(m,m))
%end

switch curva
    case 'lineas'
    [x,y] = ginput(2);  % Dos puntos que definen recta
    Xp=fix(x); Yp=fix(y);
    primitiva.marcas = [Xp Yp];
    [xp,yp] = pixel2pto(x,y,m);
    
    x1=xp(1); y1=yp(1);
    x2=xp(2); y2=yp(2);

    [X,Y] = recta_pixel(x1,y1,x2,y2);

    
    case 'circulos'
    [x,y] = ginput(2); % Coordenadas centro
    r = fix(pdist([x y],'euclidean')); %radio
    [xc yc] = pixel2pto(x(1),y(1),m);
    
    
    [X,Y] = circulo_pixel(xc,yc,r,rell);
     xp=fix(x(1));yp=fix(y(1));   
    Xp = [xp+r,xp,xp-r,xp]'; Yp = [yp,yp+r,yp,yp-r]';
    primitiva.marcas = [Xp Yp];
    
    case 'elipses'
    
    [x,y] = ginput(2);
    a = fix(abs(x(2)-x(1))); 
    b = fix(abs(y(2)-y(1)));  % Longitudes eje mayor y eje menor
    xp=fix(x);  yp=fix(y);
    [xc yc] = pixel2pto(x(1),y(1),m);
    
    [X,Y] = elipse_pixel(xc,yc,a,b,rell);

    Xp = [xp(1)+a,xp(1),xp(1)-a,xp(1)]'; Yp = [yp(1),yp(1)+b,yp(1),yp(1)-b]';
    primitiva.marcas = [Xp Yp];
    
    case 'triangulos'
      % Vertices triangulo
    [x,y] = ginput(3);
    [xp yp]=pixel2pto(x,y,m);
    x1 = xp(1); y1 = yp(1);
    x2 = xp(2); y2 = yp(2);
    x3 = xp(3); y3 = yp(3);
    
    [X,Y] = triangulo_pixel(x1,y1,x2,y2,x3,y3,rell);
    x=fix(x); y=fix(y);
    Xp = [x(1) x(2) x(3)]'; Yp = [y(1) y(2) y(3)]';
    primitiva.marcas = [Xp Yp];
    
    case 'bezier'
    [x y] = ginput(np);
    t=0:0.1:1;
    P = fix([x,y]);
    Xp=fix(x); Yp=fix(y);
    primitiva.marcas = [Xp Yp];
    [Xb Yb] = castel_pixel(P,t); %Obtengo los puntos de la curva de Beziel
    [xb yb] = pixel2pto(Xb,Yb,m);
    Bc = [];
    np=length(xb)-1;
    for k=1:np
        [xr,yr] = recta_pixel(xb(k),yb(k),xb(k+1),yb(k+1));
        Bc = [Bc;[xr,yr]];
    end
    X = Bc(:,1);
    Y = Bc(:,2);
   
end
     [C F] = pto2pixel(X,Y,m);
     primitiva.pixel = [C F];

end
