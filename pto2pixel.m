function [C,F]= pto2pixel(X,Y,m)

% Convierte  puntos de un sistema de coordenadas a Pixeles 
% indices de una matrix cuadrada de dimension m
X = fix(X); Y = fix(Y);
F = m+1-Y;
C = X;

end
