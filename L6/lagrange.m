function [L_x] = lagrange(xtek)
global xx; %узлы интерпол€ции
global yy; %значени€ в узлах интерпол€ции
l=ones(length(xtek),length(xx)); %тут хран€тс€ значени€ вспомогательного многочлена дл€ подсчета многочлена Ћагранжа

for k=1:length(xx)
    for i=1:length(xx)
        if k~=i
           l(:,k)=l(:,k).*((xtek-xx(i))./(xx(k)-xx(i)))'; 
        end
    end
end

%”добно - перемножить и сложить в нашем случае просто произведение двух
%матриц
L_x=yy*l';
end

