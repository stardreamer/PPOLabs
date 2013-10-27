function [ x,y ] = EulerArt( func,a,b,ya,n)
x=linspace(a,b,n+1);
h=x(2)-x(1);
y=ya*ones();
for i=1:length(x)-1
    y(i+1)=y(i)+h*func(x(i),y(i));
end
end

