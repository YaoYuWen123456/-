% 1.4 创造一幅 100*100 分辨率，颜色为存在红色的图（255,0,0），
%       并在硬盘上保存为文件“red.bmp”
close all;%关闭所有窗口
clear%清除变量的状态数据
clc%清除命令行
%图片大小100*100像素
length_P=100;
width_P=100;
%保存路径及图片名称
%save_path='red.bmp';
%图片颜色 （可用十进制或 十六进制0X）
Red=255;
Green=0;
Blue=0;
I = zeros(width_P,length_P,3); % 创建一个100x100的三维零矩阵
I=uint8(I);%转化为8位无符号整形
%假设图像是RGB三分量组成的图像，
R=I(:,:,1);% 那么图像的第一通道就是R
G=I(:,:,2);%第二通道是G
B=I(:,:,3);%第三通道是B

R(:,:)=Red;%R通道，也就是红色分量图像；
G(:,:)=Green;%G通道，也就是绿色分量图像；
B(:,:)=Blue;%B通道，也就是蓝色分量图像

rgb=cat(3,R,G,B);   %构建矩阵
imshow(rgb);%显示图像

imwrite(rgb,'red.bmp')%保存到图像文件