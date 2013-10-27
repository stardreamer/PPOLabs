function [ xtek,niter ] = zeidel(A,b,x0,eps )
%zeidel Calculates answer with zeidel method
%  I'm too tired to write smt more >_<
%Let's start with initialization
niter=0;
xtek=x0';
pogr=1;
b=b';
d=size(A);
if (d(1)~=d(2))
    error('Matrix is not square'); 
end
n=d(1);
while (pogr >= eps) 
    xpred=xtek;
    %xtek=zeros(n,1);
    %xtek = xtek + (tril(A)-diag(diag(A)))*xtek;
    %xtek = xtek + (triu(A)-diag(diag(A)))*xpred;
    %xtek=(b-xtek)./diag(A);
    
    for i = 1:n
        xtek(i)=0;
        for j=1:i-1
            xtek(i) = xtek(i) + A(i,j)*xtek(j);
        end
        for j=i+1:n
            xtek(i) = xtek(i) + A(i,j)*xpred(j);
        end
        xtek(i)=(b(i)-xtek(i))/A(i,i);
    end
    niter=niter+1;
    pogr=max(abs(xtek-xpred));
    %disp(xtek)
end

end

