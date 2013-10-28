function [ f ] = fibnum( n )
%fibnum calculates N's element of fibonachii series
if n<=1 
    f=1;
else
    f=fibnum(n-1)+fibnum(n-2);
end
end

