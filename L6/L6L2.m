clear all
clc
%----------------------------------------------------------------------
%������ 1
    disp('������ 1:')
%----------------------------------------------------------------------
%1.1
    disp('����� 1:')
%������������ ���
    disp('������������ ���:')
    S='x^2/12+y^2/4-1';
    disp(S)
%������� y
    disp('������� y ����� x:')
    Sy=solve(S,'y');
    disp(Sy)
%������ �������  �������� x � �������� y.
    x=-4:0.01:4;
    y=subs(Sy,'x',x);
%������� ������
    subplot(3, 3, 1),plot(x, real(y)),title('basic');
%1.2
    disp('����� 2:')
% �������� ���������� ����� x^2
%������������ ���
    disp('������������ ���:')
    S='x^2+y^2/4-1';
    disp(S)
%������� y
    disp('������� y ����� x:')
    Sy=solve(S,'y');
    disp(Sy)
%������ �������  �������� x � �������� y.
    x=-2:0.01:2;
    y=subs(Sy,'x',x);
%������� ������
    subplot(3, 3, 2),plot(x, real(y)),title('12*c*x^2'); 
% �������� ���������� ����� y^2
%������������ ���
    disp('������������ ���:')
    S='x^2/12+y^2-1';
    disp(S)
%������� y
    disp('������� y ����� x:')
    Sy=solve(S,'y');
    disp(Sy)
%������ �������  �������� x � �������� y.
    x=-6:0.01:6;
    y=subs(Sy,'x',x);
%������� ������
    subplot(3, 3, 3),plot(x, real(y)),title('4*c*y^2');
% ��������  ���������� ����� x^2
%������������ ���
    disp('������������ ���:')
    S='x^2/24+y^2/4-1';
    disp(S)
%������� y
    disp('������� y ����� x:')
    Sy=solve(S,'y');
    disp(Sy)
%������ �������  �������� x � �������� y.
    x=-6:0.01:6;
    y=subs(Sy,'x',x);
%������� ������
    subplot(3, 3, 4),plot(x, real(y)),title('1/2*c*x^2');
% ��������  ���������� ����� y^2
%������������ ���
    disp('������������ ���:')
    S='x^2/12+y^2/16-1';
    disp(S)
%������� y
    disp('������� y ����� x:')
    Sy=solve(S,'y');
    disp(Sy)
%������ �������  �������� x � �������� y.
    x=-4:0.01:4;
    y=subs(Sy,'x',x);
%������� ������
    subplot(3, 3, 5),plot(x, real(y)),title('1/4*c*y^2');
% ��������  ���������� ����� x^2 � y^2
%������������ ���
    disp('������������ ���:')
    S='x^2/24+y^2/16-1';
    disp(S)
%������� y
    disp('������� y ����� x:')
    Sy=solve(S,'y');
    disp(Sy)
%������ �������  �������� x � �������� y.
    x=-10:0.01:10;
    y=subs(Sy,'x',x);
%������� ������
    subplot(3, 3, 6),plot(x, real(y)),title('1/2*c*x^2 1/4*c*y^2');
% ��������  ���������� ����� x^2 � y^2
%������������ ���
    disp('������������ ���:')
    S='x^2+y^2-1';
    disp(S)
%������� y
    disp('������� y ����� x:')
    Sy=solve(S,'y');
    disp(Sy)
%������ �������  �������� x � �������� y.
    x=-10:0.01:10;
    y=subs(Sy,'x',x);
%������� ������
    subplot(3, 3, 7),plot(x, real(y)),title('12*c*x^2 4*c*y^2');
%----------------------------------------------------------------------
clear all
%----------------------------------------------------------------------
%������ 2
    disp('������ 2:')
%----------------------------------------------------------------------
%2.1
     disp('����� 1:')
%������������ ���
    disp('������������ ���:')
    S='x^2/9+y^2/4+z^2/25-1';
    disp(S)
%������� z
    disp('������� z ����� x � y:')
    Sz=solve(S,'z');
    disp(Sz)
%������ �������  �������� x y � �������� z.
    figure; ezsurf(Sz(1)),hold on,ezsurf(Sz(2)),axis auto,hold off,title('original'); 
%----------------------------------------------------------------------
%������������ ���
    disp('������������ ���:')
    S='x^2/9+y^2/4+z^2-1';
    disp(S)
%������� z
    disp('������� z ����� x � y:')
    Sz=solve(S,'z');
    disp(Sz)
%������ �������  �������� x y � �������� z.
    figure; subplot(2, 2, 1),ezsurf(Sz(1)),hold on,ezsurf(Sz(2)),axis auto,hold off,title('25*z');
%----------------------------------------------------------------------
%������������ ���
    disp('������������ ���:')
    S='x^2/9+y^2+z^2/25-1';
    disp(S)
%������� z
    disp('������� z ����� x � y:')
    Sz=solve(S,'z');
    disp(Sz)
%������ �������  �������� x y � �������� z.
    subplot(2, 2, 2), ezsurf(Sz(1)),hold on,ezsurf(Sz(2)),axis auto,hold off,title('4*y'); 
%----------------------------------------------------------------------
%������������ ���
    disp('������������ ���:')
    S='x^2+y^2/4+z^2/25-1';
    disp(S)
%������� z
    disp('������� z ����� x � y:')
    Sz=solve(S,'z');
    disp(Sz)
%������ �������  �������� x y � �������� z.
subplot(2, 2, 3),ezsurf(Sz(1)),hold on,ezsurf(Sz(2)),axis auto,title('9*x');
%----------------------------------------------------------------------

%������ 3
    disp('������ 3:')
%----------------------------------------------------------------------
%2.1
     disp('����� 1:')
%������������ ���
    disp('������������ ���:')
    S='x^2/9+y^2/4+z^2/25-1';
    disp(S)
%������ �������  �������� x y � �������� z.
[X,Y,Z]=meshgrid(-4:0.1:4,-2:0.1:2,-5:0.1:5);
V=X.^2/9+Y.^2/4+Z.^2/25-1;
figure;slice(X,Y,Z,V,0,0,0);
%----------------------------------------------------------------------