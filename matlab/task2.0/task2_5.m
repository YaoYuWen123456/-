close all;%�ر����д���
clear%���������״̬����
clc%���������
image1 = imread('fankuaitu.bmp');%��ȡͼƬ
figure;%��һ��������ʾͼ��
subplot(3,2,1);%һ�������еĵ�һ��ͼ
imshow(image1); %��ʾ��ɫͼ��
title('lenargbԭͼ');
% %%%%%��matelab�Դ��ĺ�����ʾ�Ҷ�%%%%%
% gray1 = rgb2gray(image1); %תΪ�Ҷ�ͼ��
% subplot(2,2,2);%һ�������еĵڶ���ͼ
% imshow(gray1);
% imwrite(gray1, 'lenargb_gray.bmp'); % ���Ҷ�ͼ�񱣴浽ͼ���ļ�
% title('lenargb�ҶȻ����ͼ��');
% %imwrite(gray1, 'lenargb_gray.bmp'); % ���Ҷ�ͼ�񱣴浽ͼ���ļ�

%%%%%%�Լ���ʾͼ��Ҷ�%%%%%%%%%%%%
[width,height,bmsize]=size(image1);%��ȡͼƬ�ߴ�
mygray=uint8(zeros(width,height));%zeros(2*3)������һ��2*3�ľ���,����һ���հ�ͼ
R=image1(:,:,1);
G=image1(:,:,2);
B=image1(:,:,3);
mygray=R.*0.299+G.*0.587+B.*0.114;%���������Ҫ��.*  
subplot(3,2,2);%һ�������еĵڶ���ͼ
imshow(mygray);
title('lenargb�Լ�����ҶȻ����ͼ��');
%%%%%%ϵͳ�Դ���ֱ��ͼ����%%%%%%%
subplot(3,2,3);
imhist(mygray);
title('lenargb�ҶȻ����ֱ��ͼ');
%%%%%%�Լ���д��ֱ��ͼ����%%%%%%%
[width,height,bmgs]=size(image1); %���ͼ��ĳߴ磺��ȣ��߶�
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

subplot(3,2,4);
plot(x,myzjhist); 
title('lenargb�Լ������ֱ��ͼ');


%%%%%%%%%%%%%%%%%%%%ȫ����ֵ�ָ%%%%%%%%%%%%%%%%%%
ar=0
for i=1:width 
 for j=1:height 
 if mygray(i,j)>250 
 mygray(i,j) =255; 
 else 
 mygray(i,j) =0;
 ar=ar+1;
 end 
 end 
end 
% figure; %�¿�����
subplot(3,2,5);
imshow(mygray); 
title('lenargbȫ����ֵ�ָ�ͼ')
mygray=~mygray;
m=sum(mygray);
n=sum(m)

%%%%%%%%%�����ɫ���%%%%%%%%%%
i=imread('fankuaitu.bmp');%���ͼƬ���Ƹ�ʽ����9.pgn
figure
subplot(2,2,1)
imshow(i);

i1=rgb2gray(i);
subplot(2,2,2)
imshow(i1);

title('lenargbhuiduͼ')
bw=imbinarize(i1,'global');
subplot(2,2,3)
imshow(bw);

title('lenargbȫ����ֵ�ָ�ͼ')
[B,L] = bwboundaries(bw,'noholes');
hold on
stats = regionprops(L,'Area','Centroid');
for k = 1:length(B)
boundary = B{k};
delta_sq = diff(boundary).^2;
perimeter = sum(sqrt(sum(delta_sq,2)));
area = stats(k).Area;
end
