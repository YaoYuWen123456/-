
%1.1ʹ��matlab��ȡһ��ͼ��
close all;%�ر����д���
clear%���������״̬����
clc%���������
% ����ͼ��
image1 = imread('lenargb.bmp');
figure;%��һ��������ʾͼ��
imshow(image1); 
title('lenargb');

% �ҶȻ�ͼƬ 
image2=imread('guazi.bmp');
figure;% ��һ���µĴ�����ʾԭͼ�ͻҶ�ͼ��
subplot(1,2,1);%һ�������еĵ�һ��ͼ
imshow(image2);%��ʾ��ɫͼ��
title('����ԭͼ');
gray = rgb2gray(image2); %תΪ�Ҷ�ͼ��
subplot(1,2,2);%һ�������еĵڶ���ͼ
imshow(gray);
title('���ӻҶȻ�');
imwrite(gray, 'guazi_gray.bmp'); % ���Ҷ�ͼ�񱣴浽ͼ���ļ�