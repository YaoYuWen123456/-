close all;%�ر����д���
clear%���������״̬����
clc%���������
image1 = imread('lenargb.bmp');%��ȡͼƬ
figure;%��һ��������ʾͼ��
subplot(2,3,1);%һ�������еĵ�һ��ͼ
imshow(image1); %��ʾ��ɫͼ��
title('lenargbԭͼ');
%%%%%��matelab�Դ��ĺ�����ʾ�Ҷ�%%%%%
gray1 = rgb2gray(image1); %תΪ�Ҷ�ͼ��
subplot(2,3,2);%һ�������еĵڶ���ͼ
imshow(gray1);
imwrite(gray1, 'lenargb_gray.bmp'); % ���Ҷ�ͼ�񱣴浽ͼ���ļ�
title('lenargb�ҶȻ����ͼ��');
%imwrite(gray1, 'lenargb_gray.bmp'); % ���Ҷ�ͼ�񱣴浽ͼ���ļ�

%%%%%%�Լ���ʾͼ��Ҷ�%%%%%%%%%%%%
[width,height,bmsize]=size(image1);%��ȡͼƬ�ߴ�
mygray=uint8(zeros(width,height));%zeros(2*3)������һ��2*3�ľ���,����һ���հ�ͼ
R=image1(:,:,1);
G=image1(:,:,2);
B=image1(:,:,3);
mygray=R.*0.299+G.*0.587+B.*0.114;%���������Ҫ��.*  
subplot(2,3,3);%һ�������еĵڶ���ͼ
imshow(mygray);
title('lenargb�ҶȻ����ͼ��');
%%%%%%ϵͳ�Դ���ֱ��ͼ����%%%%%%%
subplot(2,3,4);
imhist(gray1);
title('lenargb�ҶȻ����ֱ��ͼ');
%%%%%%�Լ���д��ֱ��ͼ����%%%%%%%
[width,height,yy]=size(image1); %���ͼ��ĳߴ磺��ȣ��߶�
myzjhist = zeros(256,1); %�Լ�����һ��ֱ��ͼ
myquzhi=0; %�õ�ͼ��Ҷ�ֵ
for i=1:width 
 for j=1:height 
 myquzhi = image1(i,j); 
 myzjhist(myquzhi+1,1) = myzjhist(myquzhi+1,1)+1; %�ûҶȵ�ֱ��ͼȡֵ+1 
 
 end 
end 
 x=0:255;
 x=x';

subplot(2,3,5);
plot(x,myzjhist); 
title('lena �Լ������ֱ��ͼ');



%%%%%%%%%%����%%%%%%%%%%%%%%%
image2 = imread('guazi.bmp'); 
figure; %��һ���´���
subplot(2,2,1);%һ�������еĵڶ���ͼ
imshow(image2); 
title('���ӵ�ԭͼ'); 
image2gray=rgb2gray(image2); 
subplot(2,2,2);%һ�������еĵڶ���ͼ
imshow(image2gray); 
title('���ӵĻҶ�ͼ'); 
%%%%%%%%%MATLAB�Դ�ֱ��ͼ����%%%%%%%%%%%
subplot(2,2,3);
imhist(image2gray,256); %����Ϊ256���Ҷȼ�
title('����ϵͳ�Դ���ֱ��ͼ'); 
%%%%%%%%%�Լ������ֱ��ͼ����%%%%%%%%%
[width,height,yy]=size(image2gray); %���ͼ��ĳߴ磺��ȣ��߶�
myzjhist = zeros(256,1); %�Լ�����һ��ֱ��ͼ����256�С�1�еþ��󹹳�ֱ��ͼ
myquzhi=0; %�õ�ͼ��Ҷ�ֵ
for i=1:width
 for j=1:height
 myquzhi = image2gray(i,j);

    myzjhist(myquzhi+1,1) = myzjhist(myquzhi+1,1)+1; %�ûҶȵ�ֱ��ͼȡֵ+1

 end 
 end 
% x=0:255
% x=x'
% for(i=0;i<255,i++)
x = zeros(256,1);
for i=0:255
    x(i+1,1)=i;
end
subplot(2,2,4);
plot(x,myzjhist); %��ͼ
title('�����Լ������ֱ��ͼ'); 