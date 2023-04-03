close all;%关闭所有窗口
clear%清除变量的状态数据
clc%清除命令行
image1 = imread('fankuaitu.bmp');%读取图片
figure;%打开一个窗口显示图像
subplot(3,2,1);%一行两列中的第一幅图
imshow(image1); %显示彩色图像
title('lenargb原图');
% %%%%%用matelab自带的函数显示灰度%%%%%
% gray1 = rgb2gray(image1); %转为灰度图像；
% subplot(2,2,2);%一行两列中的第二幅图
% imshow(gray1);
% imwrite(gray1, 'lenargb_gray.bmp'); % 将灰度图像保存到图像文件
% title('lenargb灰度化后的图像');
% %imwrite(gray1, 'lenargb_gray.bmp'); % 将灰度图像保存到图像文件

%%%%%%自己显示图像灰度%%%%%%%%%%%%
[width,height,bmsize]=size(image1);%获取图片尺寸
mygray=uint8(zeros(width,height));%zeros(2*3)代表返回一个2*3的矩阵,创建一副空白图
R=image1(:,:,1);
G=image1(:,:,2);
B=image1(:,:,3);
mygray=R.*0.299+G.*0.587+B.*0.114;%矩阵×矩阵要用.*  
subplot(3,2,2);%一行两列中的第二幅图
imshow(mygray);
title('lenargb自己计算灰度化后的图像');
%%%%%%系统自带的直方图函数%%%%%%%
subplot(3,2,3);
imhist(mygray);
title('lenargb灰度化后的直方图');
%%%%%%自己编写的直方图函数%%%%%%%
[width,height,bmgs]=size(image1); %获得图像的尺寸：宽度，高度
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

subplot(3,2,4);
plot(x,myzjhist); 
title('lenargb自己计算的直方图');


%%%%%%%%%%%%%%%%%%%%全局阈值分割法%%%%%%%%%%%%%%%%%%
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
% figure; %新开窗口
subplot(3,2,5);
imshow(mygray); 
title('lenargb全局阈值分割图')
mygray=~mygray;
m=sum(mygray);
n=sum(m)

%%%%%%%%%计算黑色面积%%%%%%%%%%
i=imread('fankuaitu.bmp');%如果图片名称格式例如9.pgn
figure
subplot(2,2,1)
imshow(i);

i1=rgb2gray(i);
subplot(2,2,2)
imshow(i1);

title('lenargbhuidu图')
bw=imbinarize(i1,'global');
subplot(2,2,3)
imshow(bw);

title('lenargb全局阈值分割图')
[B,L] = bwboundaries(bw,'noholes');
hold on
stats = regionprops(L,'Area','Centroid');
for k = 1:length(B)
boundary = B{k};
delta_sq = diff(boundary).^2;
perimeter = sum(sqrt(sum(delta_sq,2)));
area = stats(k).Area;
end
