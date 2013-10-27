function [ result,name ] = trapezoidInt( fcnHandler,a,b,n )
h=(b-a)/n;
nodes=a:h:b;
result=(h/2)*(fcnHandler(nodes(1))+fcnHandler(nodes(end))+2*sum(fcnHandler(nodes(2:1:end-1))));
name='Трапеций';
end

