clear all
clc
%Задача 1
    disp('Задача 1:')
%-------------------------------------------------------------------
%Начальные данные
a=0;
b=2;
x=a:0.1:b;
y=x.^3.*exp(-x)+6*x-5;
%xx - узлы, yy - значения в узлах
global xx;
global yy;
%n - число узлов
n=3;
xx=linspace(a,b,n);
yy=xx.^3.*exp(-xx)+6*xx-5;
%стандартный интерполятор
ak=polyfit(xx,yy,n-1);
ay=polyval(ak,x);
%Выведем функцию приближение и узлы
subplot(2,1,1),plot(x,y,'b',x,lagrange(x),'g',x,ay,'y--',xx,yy,'ro'),hleg1=legend('function','lagrange interpop','standart interpop','nodes');set(hleg1,'Location','NorthWest');
n=5;
xx=linspace(a,b,n);
yy=xx.^3.*exp(-xx)+6*xx-5;
%стандартный интерполятор
ak=polyfit(xx,yy,n-1);
ay=polyval(ak,x);
%Выведем функцию приближение и узлы
subplot(2,1,2),plot(x,y,'b',x,lagrange(x),'g',x,ay,'y--',xx,yy,'ro'),hleg1=legend('function','lagrange interpop','standart interpop','nodes');set(hleg1,'Location','NorthWest');