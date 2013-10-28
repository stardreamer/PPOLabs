function [pointer,pointP] = makeFunction(string_func)
%���������� ��������� �� �������. 
%string_func - ��������� ������������� �������(y=f(x) ������ x)
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

