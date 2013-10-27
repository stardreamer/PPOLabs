function [ result,name] = simpsonInt( fcnHandler,a,b,n )
h=(b-a)/(2*n);
nodes=a:h:b;
result=(h/3)*(fcnHandler(nodes(1))+fcnHandler(nodes(end))+4*sum(fcnHandler(nodes(2:2:end-1)))+2*sum(fcnHandler(nodes(3:2:end-1))));
name='Симпсона';
end

