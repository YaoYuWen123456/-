%   1.6ʹ��matlab�ֱ����������ͼ���ж����ǵ���ɫ
clc,clear,close all
for i = 1:3     %�ֱ��ȡ����ͼƬ
    if(i == 1)
        img = imread('tu1.jpg');
    elseif (i == 2)
        img = imread('tu2.jpg');
    elseif (i == 3)
        img = imread('tu3.jpg');
    end
    x = size(img,1);    %��ȡͼƬ���سߴ磬����xΪ���ᣬyΪ���ᡣ
    y = size(img,2);
    
    red=0;green=0;yellow=0;     %��ʼ������ɫռ��
    
    R = img(:,:,1);     %��ȡRGB������ɫ
    G = img(:,:,2);
    B = img(:,:,3);
    
    for m = 1:x      %����ͼƬ�����ɫ����ֵ
        for n=1:y    %����ͼƬ�����ɫ����ֵ
            if R(m,n)>=200 && G(m,n)<=50 && B(m,n)<=50      %�жϸõ����ɫ�Ƿ�Ϊ��ɫ
                red = red+1;                                %���ǣ����ɫռ��+1
            elseif R(m,n)<=50 && G(m,n)>=200 && B(m,n)<=50  %�жϸõ����ɫ�Ƿ�Ϊ��ɫ
                green = green+1;                            %���ǣ�����ɫռ��+1
            elseif R(m,n)>=200 && G(m,n)>=200 && B(m,n)<=50  %�жϸõ����ɫ�Ƿ�Ϊ��ɫ
                yellow = yellow+1;                          %���ǣ����ɫռ��+1
            end
        end
    end
    % figure;
    subplot(1,3,i);
    imshow(img);
    if(red>green && red>yellow)
        title('tu' +string(n) +'.jpg'+' ��ɫΪ��ɫ');
    elseif(green>red && green>yellow)
        title('tu' +string(n) +'.jpg'+' ��ɫΪ��ɫ');
    elseif(yellow>red && yellow>green)
        title('tu' +string(n) +'.jpg'+' ��ɫΪ��ɫ');
    end
end