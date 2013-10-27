clear all;
clc;
%Задача 1+2
    disp('Задача 1+2:')
    disp('----------------------------------------------------------------------------------------------------------')
%-------------------------------------------------------------------
%Начальные данные
% a - начало отрезка интегрирования
% b - конец отрезка интегрирования
% n - число отрезков
% magicFunction - творит магию

    a=0;
    b=2;
    exact=8-38*exp(-2);

    m=[magicFunction(@rectangleInt,@myfunc64,a,b,5,exact),...
       magicFunction(@rectangleInt,@myfunc64,a,b,10,exact),...
       magicFunction(@trapezoidInt,@myfunc64,a,b,5,exact),...
       magicFunction(@trapezoidInt,@myfunc64,a,b,10,exact),...
       magicFunction(@simpsonInt,@myfunc64,a,b,5,exact),...
       magicFunction(@simpsonInt,@myfunc64,a,b,10,exact),...
       magicFunction(@rectangleInt,@myfunc642,-1,1,5,exact),...
       magicFunction(@rectangleInt,@myfunc642,-1,1,10,exact),...
       magicFunction(@trapezoidInt,@myfunc642,-1,1,5,exact),...
       magicFunction(@trapezoidInt,@myfunc642,-1,1,10,exact),...
       magicFunction(@simpsonInt,@myfunc642,-1,1,5,exact),...
       magicFunction(@simpsonInt,@myfunc642,-1,1,10,exact)
    ];

   answers=[m.answer];
   Steperrors=sort([abs(answers(1:2:end)-answers(2:2:end)),abs(answers(1:2:end)-answers(2:2:end))]);
   fprintf('%-17s|%-15s|%-8s|%-8s|%-8s|%-8s|%-8s|%-8s|%-8s|%-8s|\n','Функция','Метод','Начало','Конец','Отрезков','Ответ','Точный','О(Mat)','О(Step)','О(An)')
   fprintf('----------------------------------------------------------------------------------------------------------\n')
   
   for i=1:length(m);
     m(i).Stepserror=Steperrors(i);
     temp=m(i);
     fprintf('%-17s|%-15s|%-8f|%-8f|%-8i|%-8f|%-8f|%-8f|%-8f|%-8f|\n',temp.func,temp.method,temp.a,temp.b,temp.n,temp.answer,temp.exact,temp.Matlaberror,temp.Stepserror,temp.error);
     fprintf('----------------------------------------------------------------------------------------------------------\n');
   end

 
   
