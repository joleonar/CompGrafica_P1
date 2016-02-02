function [X Y] = HorizLine(xmin, y, xmax)

X=xmin:xmax;
X=X';
Y=y*ones(length(X),1);

