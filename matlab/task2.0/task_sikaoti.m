% % % % % % % % % % % % % % % ����һ% % % % % % % % %
% ȱ�ݼ�ⷽ����ȱ��������ܳ�����
clc,clear,close all
quexian('ȱ��1.png')
quexian('ȱ��2.png')
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
title('��Ե�ݶȶ�ֵ��Ĥ')
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BWs,[se90 se0]);
subplot(222)
imshow(BWsdil)
title('�����ݶ���Ĥ')
BWdfill = imfill(BWsdil,'holes');
subplot(223)
imshow(BWdfill)
title('���ն���Ķ�ֵͼ��')
BWnobord = imclearborder(BWdfill,4);
subplot(224)
imshow(BWnobord)
title('�����Ե�Ķ�ֵͼ��')
[labeled,numObjects] = bwlabel(BWnobord,4);
data = regionprops(labeled,'all');
allArea=[data.Area];
allPerimeter=[data.Perimeter];
Area = sum(allArea);
Perimeter = sum(allPerimeter);
disp(path+" ���Ϊ��"+Area+"���ܳ�Ϊ��"+uint8(Perimeter))
end


% % % % % % % % %ѧ��������% % % % % % % % %
% % % % % % clc,clear,close all
% % % % % % img1 = imread('ȱ��1.png')
% % % % % % img2 = imread('ȱ��2.png')
% % % % % % gray1 = rgb2gray(img1);
% % % % % % gray2 =edge(gray1,'prewitt');
% % % % % % % BW2 = Prewitt(gray1)
% % % % % % % imshow(BW2)
% % % % % % subplot(1,2,1),imshow(gray1);title('ԭʼͼ��');
% % % % % % subplot(1,2,2),imshow(gray2);title('prewitt����');
% % % % % % 
% % % % % % % aaa=uint8(gray2*255)
% % % % % % aaa=uint8(gray2)
% % % % % % b1 = imbinarize(aaa,'global');
% % % % % % figure
% % % % % % imshow(b1)







% % % % % % % % % % % % ���緽��% % % % % % % % % % % % 
% % % �ο�����https://www.eefocus.com/xhly/blog/12-11/289237_9ac14.html
% % % clc,clear,close all
% % % 
% % % % T = imread ('bat.bmp');%����ͼ��
% % % 
% % % T = imread ('ȱ��2.png');%����ͼ��
% % % 
% % % M = imresize ( T ,[256 ,256 ]);%��ͼ�����256 ��256 ,Ϊ����ʾ����
% % % 
% % % YT = rgb2gray(M);%��RGB ��ʽת��Ϊ�Ҷ�ͼ��
% % % 
% % % figure , imshow( YT) ;
% % % 
% % % title ('ԭʼͼ��')%��ʾԭʼͼ��
% % % 
% % %  
% % % 
% % %  
% % % 
% % % % ȥ��%
% % % 
% % % %1 ��ֵ�˲�ȥ��%
% % % 
% % % Z1 = medfilt2 (YT ,[5 ,5 ]);
% % % 
% % % %2 С������ȥ��%
% % % 
% % % %ʹ��sym4 С��,�趨ȫ����ֵȥ��%
% % % 
% % % [ THR ,SORH ,KEEPAPP] = ddencmp('den','wv', Z1);
% % % 
% % % X = wdencmp( 'gbl',Z1, 'sym4',2 ,THR ,SORH ,KEEPAPP);
% % % 
% % % figure, imshow(X,[ ]);
% % % 
% % % title ('ȥ��ͼ��') %��ʾȥ��ͼ��
% % % 
% % %  
% % % 
% % %  
% % % 
% % % [Z1,s ] = wavedec2 (X ,2, 'sym4');
% % % 
% % % %���ж���С���ֽ�
% % % 
% % % len = length ( Z1 );
% % % 
% % % %����ֽ�ϵ��,ͻ������,����ϸ��%
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
% % % Z = waverec2 (Z1 ,s, 'sym4'); %�ֽ�ϵ���ع�
% % % 
% % % figure , imshow(Z ,[ ]);
% % % 
% % % title ('��ǿͼ��') ;%��ʾ��ǿͼ��
% % % 
% % %  
% % % 
% % %  
% % % 
% % % BW1 = edge(Z, 'canny',0.3); %canny��Ե���
% % % 
% % % figure, imshow(BW1 );
% % % 
% % % title ('canny ���Ч��');%��ʾ��Ե���ͼ��
% % % 
% % %  
% % % 
% % %  
% % % 
% % % % ���϶%
% % % 
% % % se90 = strel ('line',3 ,90);
% % % 
% % % se0 = strel ('line',3 ,0);
% % % 
% % % % ���Ͳ���%
% % % 
% % % BWsdil = imdilate (BW1 ,[ se90 ,se0 ]);
% % % 
% % % figure , imshow(BWsdil);
% % % 
% % % title ('����ͼ��') ;%��ʾ����ͼ��
% % % 
% % % % ���%
% % % 
% % % BWdfill = imfill (BWsdil, 'holes');
% % % 
% % % figure , imshow(BWdfill);
% % % 
% % % title ('���ͼ��'); %��ʾ���ͼ��
% % % 
% % % % �Ƴ���߽���ͨ��Ŀ��%
% % % 
% % % BWnobord = imclearborder (BWdfill ,4);
% % % 
% % % figure , imshow(BWnobord);
% % % 
% % % title ('�Ƴ���߽���ͨ��ͼ��');
% % % 
% % % %��ʾ�Ƴ���߽���ͨ��ͼ��
% % % 
% % % % ƽ��%
% % % 
% % % seD = strel ('diamond',1);
% % % 
% % % BWfinal1 = imerode (BWnobord ,seD);
% % % 
% % % BWfinal2 = imerode (BWfinal1 ,seD);
% % % 
% % % figure , imshow(BWfinal2);
% % % 
% % % title ('ƽ��ͼ��'); %��ʾƽ��ͼ��
% % % 
% % %  
% % % 
% % %  
% % % 
% % % % �������Ƶ����%
% % % 
% % % count = 0; % ��¼����ͼ�����ص�ĸ���
% % % 
% % % [ i , j ] = size (BWfinal2);
% % % 
% % % for m = 1 : i
% % % 
% % %     for n = 1 : j
% % % 
% % %         if BWfinal2 (m , n) > 0% �ж��Ƿ�Ϊ����ͼ�����ص�
% % % 
% % %         count = count + 1 ;
% % % 
% % %         end
% % % 
% % %     end
% % % 
% % % end
% % % 
% % % S = count %ͳ������ͼ�����ص�ĸ���
% % % 
% % %  
% % % 
% % %  
% % % 
% % % BWfinal3 = uint8 (BWfinal2);
% % % 
% % % BW2 = edge (BWfinal3, 'canny');% ��Ե��ȡ
% % % 
% % % figure ,imshow(BW2 );
% % % 
% % % title('canny ���Ч��') ;%��ʾ��Ե���ͼ��
% % % 
% % % [ x , y ] = size (BW2 );
% % % 
% % % BW = bwperim(BW2 ,8);
% % % 
% % % % ���Ŀ��ı�Ե����,���ڼ����ܳ�
% % % 
% % % % ��ⴹֱ�����������ܳ����ص�%
% % % 
% % % P1 = 0;
% % % 
% % % P2 = 0;
% % % 
% % % Ny = 0;%��¼��ֱ���������ܳ����ص�ĸ���
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
% % % % �ж��Ƿ�Ϊ��ֱ�����������ܳ����ص�
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
% % % % ���ˮƽ�����������ܳ����ص�%
% % % 
% % % P1 = 0;
% % % 
% % % P2 = 0;
% % % 
% % % Nx = 0;%��¼ˮƽ���������ܳ����ص�ĸ���
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
% % % % �ж��Ƿ�Ϊˮƽ�����������ܳ����ص�
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
% % % Ns = sum( sum(BW) );%�����ܳ����ص�����
% % % 
% % % Nd = Ns - Nx - Ny ;% �����������������
% % % 
% % % L = sqrt (2) * Nd + Nx + Ny;% �����ܳ�
% % % 
% % %  
% % % 
% % % for i=1:9
% % % 
% % %     saveas(figure(i),['figure' num2str(i) '.png'])
% % % 
% % % end

