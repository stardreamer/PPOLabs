function [ xRes,yRes,stringM ] = FibMinNum( f,c,d,N )
%Задаем границы отрезка
a = c; 
b = d;
%Начальные значения x
x1 = a+(b-a)*fibnum(N-2)/fibnum(N);
x2 = a+(b-a)*fibnum(N-1)/fibnum(N);
y1 = f(x1);
y2 = f(x2);
for k=N:-1:1 
     if y1>y2
         a = x1; 
         x1= x2;
         x2 = b-x1+a;
         y1 = y2; 
         y2 = f(x2);
     else
         b = x2; 
         x2 = x1; 
         x1 = a+b-x2; 
         y2 = y1; 
         y1 = f(x1);
     end
end

if f(x1)<f(x2)
    xRes=x1;
    yRes=y1;
else
    xRes=x2;
    yRes=y2;
end
stringM ='Метод Фибоначчи';
end

