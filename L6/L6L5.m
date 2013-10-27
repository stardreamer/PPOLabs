clear all;
clc;
%Задача 1+2
[xE,yE]=EulerArt(@Myf,2,3,4,10);
[xRK2,yRK2]=RK2(@Myf,2,3,4,10);
[xRK4,yRK4]=RK4(@Myf,2,3,4,10);
[xOD23,yOD23]=ode23(@Myf,[2,3],4);
[xOD45,yOD45]=ode45(@Myf,[2,3],4);
exact=solOfDU(xE);
plot(xE,exact,'b-o',xE,yE,'g--o',xRK2,yRK2,'r--o',xRK4,yRK4,'c--o',xOD23,yOD23,'k--o',xOD45,yOD45,'m--o'),hleg1=legend('Точное решение','Эйлер','РК2','RK4','ode23','ode45');set(hleg1,'Location','NorthWest');
fprintf('Погрешность\n%-8s %-8s %-8s %-8s %-8s \n','Эйлер','РК2','RK4','ode23','ode45')
fprintf('%-8f %-8f %-8f %-8f %-8f \n',abs(exact(end)-yE(end)),abs(exact(end)-yRK2(end)),abs(exact(end)-yRK4(end)),abs(exact(end)-yOD23(end)),abs(exact(end)-yOD45(end)))