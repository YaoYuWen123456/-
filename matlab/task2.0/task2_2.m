close all;%关闭所有窗口
clear%清除变量的状态数据
clc%清除命令行
image1 = imread('lenargb.bmp');%读取图片
figure;%打开一个窗口显示图像
subplot(2,3,1);%一行两列中的第一幅图
imshow(image1); %显示彩色图像
title('lenargb原图');
%%%%%用matelab自带的函数显示灰度%%%%%
gray1 = rgb2gray(image1); %转为灰度图像；
subplot(2,3,2);%一行两列中的第二幅图
imshow(gray1);
imwrite(gray1, 'lenargb_gray.bmp'); % 将灰度图像保存到图像文件
title('lenargb灰度化后的图像');
%imwrite(gray1, 'lenargb_gray.bmp'); % 将灰度图像保存到图像文件

%%%%%%自己显示图像灰度%%%%%%%%%%%%
[width,height,bmsize]=size(image1);%获取图片尺寸
mygray=uint8(zeros(width,height));%zeros(2*3)代表返回一个2*3的矩阵,创建一副空白图
R=image1(:,:,1);
G=image1(:,:,2);
B=image1(:,:,3);
mygray=R.*0.299+G.*0.587+B.*0.114;%矩阵×矩阵要用.*  
subplot(2,3,3);%一行两列中的第二幅图
imshow(mygray);
title('lenargb灰度化后的图像');
%%%%%%系统自带的直方图函数%%%%%%%
subplot(2,3,4);
imhist(gray1);
title('lenargb灰度化后的直方图');
%%%%%%自己编写的直方图函数%%%%%%%
[width,height,yy]=size(image1); %获得图像的尺寸：宽度，高度
myzjhist = zeros(256,1); %自己定义一个直方图
myquzhi=0; %该点图像灰度值
for i=1:width 
 for j=1:height 
 myquzhi = image1(i,j); 
 myzjhist(myquzhi+1,1) = myzjhist(myquzhi+1,1)+1; %该灰度的直方图取值+1 
 
 end 
end 
 x=0:255;
 x=x';

subplot(2,3,5);
plot(x,myzjhist); 
title('lena 自己计算的直方图');



%%%%%%%%%%瓜子%%%%%%%%%%%%%%%
image2 = imread('guazi.bmp'); 
figure; %打开一个新窗口
subplot(2,2,1);%一行两列中的第二幅图
imshow(image2); 
title('瓜子的原图'); 
image2gray=rgb2gray(image2); 
subplot(2,2,2);%一行两列中的第二幅图
imshow(image2gray); 
title('瓜子的灰度图'); 
%%%%%%%%%MATLAB自带直方图函数%%%%%%%%%%%
subplot(2,2,3);
imhist(image2gray,256); %划分为256个灰度级
title('瓜子系统自带的直方图'); 
%%%%%%%%%自己计算得直方图函数%%%%%%%%%
[width,height,yy]=size(image2gray); %获得图像的尺寸：宽度，高度
myzjhist = zeros(256,1); %自己定义一个直方图生成256行×1列得矩阵构成直方图
myquzhi=0; %该点图像灰度值
for i=1:width
 for j=1:height
 myquzhi = image2gray(i,j);

    myzjhist(myquzhi+1,1) = myzjhist(myquzhi+1,1)+1; %该灰度的直方图取值+1

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
plot(x,myzjhist); %画图
title('瓜子自己计算的直方图'); 