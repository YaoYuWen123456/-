close all;%�ر����д���
clear%���������״̬����
clc%���������
image1 = imread('lenargb.bmp');%��ȡͼƬ
figure;%��һ��������ʾͼ��
subplot(1,3,1);%һ�������еĵ�һ��ͼ
imshow(image1); %��ʾ��ɫͼ��
title('lenargbԭͼ');
%%%%%��matelab�Դ��ĺ�����ʾ�Ҷ�%%%%%
gray1 = rgb2gray(image1); %תΪ�Ҷ�ͼ��
subplot(1,3,2);%һ�������еĵڶ���ͼ
imshow(gray1);
title('lenargb�ҶȻ����ͼ��');
imwrite(gray1, 'lenargb_gray.bmp'); % ���Ҷ�ͼ�񱣴浽ͼ���ļ�
%%%%%���Լ���д�ĺ�����ʾ�Ҷ�%%%%%%
[width,height,bmsize]=size(image1);%��ȡͼƬ�ߴ�
%print('width,height');%%%%%%%%%%%
mygray=uint8(zeros(width,height));%zeros(2*3)������һ��2*3�ľ���,����һ���հ�ͼ

R=uint32(image1(:,:,1));
G=uint32(image1(:,:,2));
B=uint32(image1(:,:,3));
% mygray=R.*0.299+G.*0.587+B.*0.114;%���������Ҫ��.*  
mygray =uint8((R.*299 +G.*587 + B.*114 + 500)/ 1000);
%  mygray =(R*30 + G*59 + B*11 + 50) / 100;
% mygray=image1.*0.299+image1.*0.587+image1.*0.114;
% for i=1:width
%     for j=1:height
%         %%%gray=R*0.299+G*0.587+B*0.114
%         mygray(i,j)=image1(i,j,1)*0.299+image1(i,j,2)*0.587+image1(i,j,3)*0.114;%�Լ���д�����õ��ĻҶ�ͼ
%     end
% end
subplot(1,3,3);%һ�������еĵڶ���ͼ
imshow(mygray);
title('lenargb�Լ�����õ��ĻҶ�ͼ');
