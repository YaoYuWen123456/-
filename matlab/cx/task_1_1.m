
%1.1使用matlab读取一幅图像
close all;%关闭所有窗口
clear%清除变量的状态数据
clc%清除命令行
% 读入图像
image1 = imread('lenargb.bmp');
figure;%打开一个窗口显示图像
imshow(image1); 
title('lenargb');

% 灰度化图片 
image2=imread('guazi.bmp');
figure;% 打开一个新的窗口显示原图和灰度图像
subplot(1,2,1);%一行两列中的第一幅图
imshow(image2);%显示彩色图像；
title('瓜子原图');
gray = rgb2gray(image2); %转为灰度图像；
subplot(1,2,2);%一行两列中的第二幅图
imshow(gray);
title('瓜子灰度化');
imwrite(gray, 'guazi_gray.bmp'); % 将灰度图像保存到图像文件