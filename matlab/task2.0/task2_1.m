close all;%关闭所有窗口
clear%清除变量的状态数据
clc%清除命令行
image1 = imread('lenargb.bmp');%读取图片
figure;%打开一个窗口显示图像
subplot(1,3,1);%一行两列中的第一幅图
imshow(image1); %显示彩色图像
title('lenargb原图');
%%%%%用matelab自带的函数显示灰度%%%%%
gray1 = rgb2gray(image1); %转为灰度图像；
subplot(1,3,2);%一行两列中的第二幅图
imshow(gray1);
title('lenargb灰度化后的图像');
imwrite(gray1, 'lenargb_gray.bmp'); % 将灰度图像保存到图像文件
%%%%%用自己编写的函数显示灰度%%%%%%
[width,height,bmsize]=size(image1);%获取图片尺寸
%print('width,height');%%%%%%%%%%%
mygray=uint8(zeros(width,height));%zeros(2*3)代表返回一个2*3的矩阵,创建一副空白图

R=uint32(image1(:,:,1));
G=uint32(image1(:,:,2));
B=uint32(image1(:,:,3));
% mygray=R.*0.299+G.*0.587+B.*0.114;%矩阵×矩阵要用.*  
mygray =uint8((R.*299 +G.*587 + B.*114 + 500)/ 1000);
%  mygray =(R*30 + G*59 + B*11 + 50) / 100;
% mygray=image1.*0.299+image1.*0.587+image1.*0.114;
% for i=1:width
%     for j=1:height
%         %%%gray=R*0.299+G*0.587+B*0.114
%         mygray(i,j)=image1(i,j,1)*0.299+image1(i,j,2)*0.587+image1(i,j,3)*0.114;%自己编写函数得到的灰度图
%     end
% end
subplot(1,3,3);%一行两列中的第二幅图
imshow(mygray);
title('lenargb自己计算得到的灰度图');
