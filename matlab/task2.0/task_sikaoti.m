% % % % % % % % % % % % % % % 方法一% % % % % % % % %
% 缺陷检测方法及缺陷面积、周长计算
clc,clear,close all
quexian('缺陷1.png')
quexian('缺陷2.png')
function quexian(path)
I=imread(path);
figure
imshow(I)
I2 = rgb2gray(I);
[junk, threshold] = edge(I2,'sobel');
fudgeFactor=0.7;
BWs = edge(I2,'sobel',threshold*fudgeFactor);
figure
subplot(221)
imshow(BWs)
title('边缘梯度二值掩膜')
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BWs,[se90 se0]);
subplot(222)
imshow(BWsdil)
title('膨胀梯度掩膜')
BWdfill = imfill(BWsdil,'holes');
subplot(223)
imshow(BWdfill)
title('填充空洞后的二值图像')
BWnobord = imclearborder(BWdfill,4);
subplot(224)
imshow(BWnobord)
title('清楚边缘的二值图像')
[labeled,numObjects] = bwlabel(BWnobord,4);
data = regionprops(labeled,'all');
allArea=[data.Area];
allPerimeter=[data.Perimeter];
Area = sum(allArea);
Perimeter = sum(allPerimeter);
disp(path+" 面积为："+Area+"，周长为："+uint8(Perimeter))
end


% % % % % % % % %学生方法二% % % % % % % % %
% % % % % % clc,clear,close all
% % % % % % img1 = imread('缺陷1.png')
% % % % % % img2 = imread('缺陷2.png')
% % % % % % gray1 = rgb2gray(img1);
% % % % % % gray2 =edge(gray1,'prewitt');
% % % % % % % BW2 = Prewitt(gray1)
% % % % % % % imshow(BW2)
% % % % % % subplot(1,2,1),imshow(gray1);title('原始图像');
% % % % % % subplot(1,2,2),imshow(gray2);title('prewitt算子');
% % % % % % 
% % % % % % % aaa=uint8(gray2*255)
% % % % % % aaa=uint8(gray2)
% % % % % % b1 = imbinarize(aaa,'global');
% % % % % % figure
% % % % % % imshow(b1)







% % % % % % % % % % % % 网络方法% % % % % % % % % % % % 
% % % 参考程序：https://www.eefocus.com/xhly/blog/12-11/289237_9ac14.html
% % % clc,clear,close all
% % % 
% % % % T = imread ('bat.bmp');%读入图像
% % % 
% % % T = imread ('缺陷2.png');%读入图像
% % % 
% % % M = imresize ( T ,[256 ,256 ]);%将图像调整256 ×256 ,为了显示方便
% % % 
% % % YT = rgb2gray(M);%将RGB 格式转换为灰度图像
% % % 
% % % figure , imshow( YT) ;
% % % 
% % % title ('原始图像')%显示原始图像
% % % 
% % %  
% % % 
% % %  
% % % 
% % % % 去噪%
% % % 
% % % %1 中值滤波去噪%
% % % 
% % % Z1 = medfilt2 (YT ,[5 ,5 ]);
% % % 
% % % %2 小波分析去噪%
% % % 
% % % %使用sym4 小波,设定全局阈值去噪%
% % % 
% % % [ THR ,SORH ,KEEPAPP] = ddencmp('den','wv', Z1);
% % % 
% % % X = wdencmp( 'gbl',Z1, 'sym4',2 ,THR ,SORH ,KEEPAPP);
% % % 
% % % figure, imshow(X,[ ]);
% % % 
% % % title ('去噪图像') %显示去噪图像
% % % 
% % %  
% % % 
% % %  
% % % 
% % % [Z1,s ] = wavedec2 (X ,2, 'sym4');
% % % 
% % % %进行二层小波分解
% % % 
% % % len = length ( Z1 );
% % % 
% % % %处理分解系数,突出轮廓,弱化细节%
% % % 
% % % for i = 1 :len
% % % 
% % %     if (Z1(i) > 800)
% % % 
% % %         Z1(i) = 2*Z1(i);
% % % 
% % %     else
% % % 
% % %         Z1(i) = 0.5*Z1(i);
% % % 
% % %     end
% % % 
% % % end
% % % 
% % % Z = waverec2 (Z1 ,s, 'sym4'); %分解系数重构
% % % 
% % % figure , imshow(Z ,[ ]);
% % % 
% % % title ('增强图像') ;%显示增强图像
% % % 
% % %  
% % % 
% % %  
% % % 
% % % BW1 = edge(Z, 'canny',0.3); %canny边缘检测
% % % 
% % % figure, imshow(BW1 );
% % % 
% % % title ('canny 检测效果');%显示边缘检测图像
% % % 
% % %  
% % % 
% % %  
% % % 
% % % % 填补缝隙%
% % % 
% % % se90 = strel ('line',3 ,90);
% % % 
% % % se0 = strel ('line',3 ,0);
% % % 
% % % % 膨胀操作%
% % % 
% % % BWsdil = imdilate (BW1 ,[ se90 ,se0 ]);
% % % 
% % % figure , imshow(BWsdil);
% % % 
% % % title ('膨胀图像') ;%显示膨胀图像
% % % 
% % % % 填充%
% % % 
% % % BWdfill = imfill (BWsdil, 'holes');
% % % 
% % % figure , imshow(BWdfill);
% % % 
% % % title ('填充图像'); %显示填充图像
% % % 
% % % % 移除与边界连通的目标%
% % % 
% % % BWnobord = imclearborder (BWdfill ,4);
% % % 
% % % figure , imshow(BWnobord);
% % % 
% % % title ('移除与边界连通的图像');
% % % 
% % % %显示移除与边界连通的图像
% % % 
% % % % 平滑%
% % % 
% % % seD = strel ('diamond',1);
% % % 
% % % BWfinal1 = imerode (BWnobord ,seD);
% % % 
% % % BWfinal2 = imerode (BWfinal1 ,seD);
% % % 
% % % figure , imshow(BWfinal2);
% % % 
% % % title ('平滑图像'); %显示平滑图像
% % % 
% % %  
% % % 
% % %  
% % % 
% % % % 计算裂纹的面积%
% % % 
% % % count = 0; % 记录裂纹图像像素点的个数
% % % 
% % % [ i , j ] = size (BWfinal2);
% % % 
% % % for m = 1 : i
% % % 
% % %     for n = 1 : j
% % % 
% % %         if BWfinal2 (m , n) > 0% 判断是否为裂纹图像像素点
% % % 
% % %         count = count + 1 ;
% % % 
% % %         end
% % % 
% % %     end
% % % 
% % % end
% % % 
% % % S = count %统计裂纹图像像素点的个数
% % % 
% % %  
% % % 
% % %  
% % % 
% % % BWfinal3 = uint8 (BWfinal2);
% % % 
% % % BW2 = edge (BWfinal3, 'canny');% 边缘提取
% % % 
% % % figure ,imshow(BW2 );
% % % 
% % % title('canny 检测效果') ;%显示边缘检测图像
% % % 
% % % [ x , y ] = size (BW2 );
% % % 
% % % BW = bwperim(BW2 ,8);
% % % 
% % % % 检测目标的边缘跟踪,用于计算周长
% % % 
% % % % 检测垂直方向连续的周长像素点%
% % % 
% % % P1 = 0;
% % % 
% % % P2 = 0;
% % % 
% % % Ny = 0;%记录垂直方向连续周长像素点的个数
% % % 
% % % for i = 1 : x
% % % 
% % % 	for j = 1 : y
% % % 
% % %         if (BW( i , j) > 0)
% % % 
% % %             P2 = j;
% % % 
% % %             if ( ( P2 - P1 ) == 1)
% % % 
% % % % 判断是否为垂直方向连续的周长像素点
% % % 
% % %                 Ny = Ny + 1;
% % % 
% % %             end
% % % 
% % %             P1 = P2;
% % % 
% % %         end
% % % 
% % % 	end
% % % 
% % % end
% % % 
% % % % 检测水平方向连续的周长像素点%
% % % 
% % % P1 = 0;
% % % 
% % % P2 = 0;
% % % 
% % % Nx = 0;%记录水平方向连续周长像素点的个数
% % % 
% % % for j = 1 : y
% % % 
% % % 	for i = 1 : x
% % % 
% % %         if (BW( i , j) > 0)
% % % 
% % %             P2 = i;
% % % 
% % %             if ( ( P2 - P1 ) == 1)
% % % 
% % % % 判断是否为水平方向连续的周长像素点
% % % 
% % %                 Nx = Nx + 1;
% % % 
% % %             end
% % % 
% % %             P1 = P2;
% % % 
% % %         end
% % % 
% % %     end
% % % 
% % % end
% % % 
% % % Ns = sum( sum(BW) );%计算周长像素点总数
% % % 
% % % Nd = Ns - Nx - Ny ;% 计算奇数码的链码数
% % % 
% % % L = sqrt (2) * Nd + Nx + Ny;% 计算周长
% % % 
% % %  
% % % 
% % % for i=1:9
% % % 
% % %     saveas(figure(i),['figure' num2str(i) '.png'])
% % % 
% % % end

