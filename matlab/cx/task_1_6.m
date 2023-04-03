%   1.6使用matlab分别打开下面三幅图，判断它们的颜色
clc,clear,close all
for i = 1:3     %分别读取三张图片
    if(i == 1)
        img = imread('tu1.jpg');
    elseif (i == 2)
        img = imread('tu2.jpg');
    elseif (i == 3)
        img = imread('tu3.jpg');
    end
    x = size(img,1);    %获取图片像素尺寸，其中x为横轴，y为纵轴。
    y = size(img,2);
    
    red=0;green=0;yellow=0;     %初始化各颜色占比
    
    R = img(:,:,1);     %获取RGB三层颜色
    G = img(:,:,2);
    B = img(:,:,3);
    
    for m = 1:x      %遍历图片求各颜色像素值
        for n=1:y    %遍历图片求各颜色像素值
            if R(m,n)>=200 && G(m,n)<=50 && B(m,n)<=50      %判断该点的颜色是否为红色
                red = red+1;                                %若是，则红色占比+1
            elseif R(m,n)<=50 && G(m,n)>=200 && B(m,n)<=50  %判断该点的颜色是否为绿色
                green = green+1;                            %若是，则绿色占比+1
            elseif R(m,n)>=200 && G(m,n)>=200 && B(m,n)<=50  %判断该点的颜色是否为黄色
                yellow = yellow+1;                          %若是，则黄色占比+1
            end
        end
    end
    % figure;
    subplot(1,3,i);
    imshow(img);
    if(red>green && red>yellow)
        title('tu' +string(n) +'.jpg'+' 颜色为红色');
    elseif(green>red && green>yellow)
        title('tu' +string(n) +'.jpg'+' 颜色为绿色');
    elseif(yellow>red && yellow>green)
        title('tu' +string(n) +'.jpg'+' 颜色为黄色');
    end
end