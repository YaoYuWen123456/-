close all;%关闭所有窗口
clear%清除变量的状态数据
clc%清除命令行
%%%%%%用matlab自带的函数均衡直方图%%%%%%%%%%%%%%%
H= imread('zftjh.jpg'); %读取图片

if length(size(H))>2 %判断是否为三通道彩色图片 若是 则将其灰度化
    H=rgb2gray(H);  %灰度化
end
subplot(3,2,1);  
imshow(H); title('原图');  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [width,height,bmsize]=size(H);%获取图片尺寸
% W=uint8(zeros(width,height));%zeros(2*3)代表返回一个2*3的矩阵,创建一副空白图
% R=H(:,:,1);
% G=H(:,:,1);
% B=H(:,:,1);
% H=R.*0.299+G.*0.587+B.*0.114;%矩阵×矩阵要用.*  
% subplot(3,2,1);  
% imshow(H);
% title('原图');
% imshow(H);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,2,2);  
imhist(H); title('原图直方图');  
subplot(3,2,3);  
H1=adapthisteq(H);  
imshow(H1); title('adapthisteq均衡后图');  
subplot(3,2,4);  
imhist(H1);title('adapthisteq均衡后直方图');  
subplot(3,2,5);  
H2=histeq(H);  
imshow(H2); title('histeq均衡后图');  
subplot(3,2,6);  
imhist(H1); title('histeq均衡后直方图'); 





%%%%%%%%%%自己编写直方图均衡化的代码%%%%%%%%%%%%%
H= imread('zftjh.jpg'); 

%判断是否为三通道彩色图片 若是 则将其灰度化
if length(size(H))>2
    H=rgb2gray(H);  
end
figure;
subplot(2,2,1);  
imshow(H);  
title('原图');  

%获取图片的尺寸 便于计算总像素数 即m*n 
[m,n]=size(H);  
%生成一个一行256列的一维数组
p=zeros(1,256);  
% 统计各灰度的像素个数 
%find(H==i) 是在图像矩阵里面寻找灰度为i的点坐标 
% 因为矩阵是从1开始的 所以为p(i+1) 
%p是计算每个点的概率
for i=0:255  
    
  p(i+1)=length(find(H==i))/(m*n);  

end  
subplot(2,2,2);  
% 显示原图的直方图
bar(0:255,p,'b');  
title('原图直方图');  
 

 % 利用循环 累加概率值
s=zeros(1,256);  %建立一个【1，256】的0数组。
for i=1:256  
     for j=1:i  
         s(i)=p(j)+s(i); %定义了一个新的一维数组s                 
     end  
end  

%对s中的数先乘以255，再取整   
 a=round(s*255);   % round是取整函数 把数组的像素值从0-1的概率扩展到0-255,
b=H;  
%更新原图像的灰度
for i=0:255  
     b(find(H==i))=a(i+1);  %改变b中的像素点值找到b中存放像素100的所有位置，把他改为a101对应的像素值        
end
subplot(2,2,3);  
imshow(b)                            
title('均衡化后图像');  

 %统计更新后的概率  将概率进行累加
for i=0:255  
    GPeq(i+1)=sum(p(find(a==i)));            
end  
subplot(2,2,4);  
bar(0:255,GPeq,'b'); title('均衡化后的直方图'); 

