function [ results ] = magicFunction(method,func,a,b,n,exact)
%Тут творится магия
%   А именно заполняется структура с ответами
results.a=a;
results.b=b;
results.exact=exact;
results.n=n;
[~,results.func]=func(0);
[results.answer,results.method]=method(func,a,b,n);
results.error=abs(exact-results.answer);
results.Matlaberror=abs(results.answer-quad(func,a,b));
results.Stepserror=-1;
end

