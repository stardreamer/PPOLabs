clear all;
clc;
%��������� ��������
I = imread('lr7_1.jpg');
%����������� �����
I1 = imopen(I,strel('disk',11));
subplot(221),imshow(I1)
%����������� �������/�������������
I2=imadjust(I1,[0.1 0.2],[]);
subplot(222),imshow(I2)
%����������
I3 = im2bw(I2,0.56);
subplot(223),imshow(I3);

%�������� ����� �����������
h=fspecial('disk',11);
%��������� ����������� � �������� � ������
I4 = imfilter(I3,h,'circular','conv');
subplot(224),imshow(I4);

[label,num]=bwlabel(~I4,8);
num

