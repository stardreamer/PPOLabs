function [result,name] = rectangleInt(fcnHandler,a,b,n)
nodes=linspace(a,b,n+1);
nodes=(nodes(2:1:end)+nodes(1:1:end-1))/2;
result=((b-a)/n)*sum(fcnHandler(nodes));
name='Прямоугольника';
end

