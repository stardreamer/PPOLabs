function [pointer,pointP] = makeFunction(string_func)
%Возвращает указатель на функцию. 
%string_func - строковое представление функции(y=f(x) именно x)
pointer=@func;
pointP=@funcP;
   function y=func(x)
       y=subs(string_func,'x',x);
   end

   function [y,temp]=funcP(xC)
       x=0;
       syms x;
       temp=diff(string_func,x,1);
       y=subs(temp,'x',xC);
   end
end

