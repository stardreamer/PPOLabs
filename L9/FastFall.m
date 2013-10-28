function [ xRes,yRes,stringM ] = FastFall( f,f1,x0,eps )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

xprev = x0; 
lambda = 1;
i=0;
while(true)
    %Выбираем шаг 
    while(true)
        if f(xprev-lambda*f1(xprev))-f(xprev) > -1/(2)*lambda*(f1(xprev))*(f1(xprev))
            lambda=lambda/2;
        else break
        end
    end
    
    x=xprev-f1(xprev)*lambda;
    
    if abs(f(x)-f(xprev)) < eps  
        break
    end
    
    xprev=x;
end
xRes=x;
yRes=f(x);
stringM ='Метод быстрого спуска';
end

