function [ xRes,yRes,stringM] = GoldStash( f,c,d,eps )
%Ищет минимум методом золотого сечения 
%   Detailed explanation goes here
a = c; 
b = d;
phi = (1+sqrt(5))*(1/2);

while(true)
    x1 = b-(b-a)/phi; 
    x2 = a+(b-a)/phi;

    y1 = f(x1); 
    y2 = f(x2);

    if y1 >= y2 
        a = x1; 
    else 
        b = x2; 
    end 

    if abs(b-a) < eps  
        x1 = (a+b)*(1/2); 
        break 
    end
end
xRes=x1;
yRes=f(x1);
stringM ='Метод золотого сечения';
end

