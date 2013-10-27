function [ x,y ] = RK4( func,a,b,ya,n )
x=linspace(a,b,n+1);
h=x(2)-x(1);
y=ya*ones();
for i=1:length(x)-1
    m1=func(x(i),y(i));
    m2=func(x(i)+h/2,y(i)+(h/2)*m1);
    m3=func(x(i)+h/2,y(i)+(h/2)*m2);
    m4=func(x(i)+h,y(i)+h*m3);
    y(i+1)=y(i)+h/6*(m1+2*m2+2*m3+m4);
end
end

