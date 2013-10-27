function [L_x] = lagrange(xtek)
global xx; %���� ������������
global yy; %�������� � ����� ������������
l=ones(length(xtek),length(xx)); %��� �������� �������� ���������������� ���������� ��� �������� ���������� ��������

for k=1:length(xx)
    for i=1:length(xx)
        if k~=i
           l(:,k)=l(:,k).*((xtek-xx(i))./(xx(k)-xx(i)))'; 
        end
    end
end

%������ - ����������� � ������� � ����� ������ ������ ������������ ����
%������
L_x=yy*l';
end

