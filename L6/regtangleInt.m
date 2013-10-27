function [result] = rectangleInt(funcHandler,a,b,n)
nodes=linspace(a,b,n);
nodes=nodes(1:2:end);
result=((b-a)/n)*sum(funcHandler(nodes));
end

