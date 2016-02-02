function [X Y] = pixel2pto(C,F,m) 

% Convierte pixeles indice de matriz cuadrada de dimensión m
F = fix(F); C = fix(C);
X=C;
Y=m+1-F;

end