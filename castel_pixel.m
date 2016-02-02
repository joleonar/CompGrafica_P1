function [X,Y]=castel_pixel(p,t)

% Algoritmo de Casteljou

n=size(p,1)-1;

for j=1:length(t)
    c=zeros(n+1,n+1,2);
    for i=1:n
        c(1,i,:)=(1-t(j))*p(i,:)+t(j)*p(i+1,:);
    end   
    for r=2:n
        for i=1:n+1-r
            c(r,i,:)=(1-t(j))*c(r-1,i,:)+t(j)*c(r-1,i+1,:);
        end
    end   
    X(j)=c(n,1,1);
    Y(j)=c(n,1,2);
end

