close all;%�ر����д���
clear%���������״̬����
clc%���������
%%%%%%��matlab�Դ��ĺ�������ֱ��ͼ%%%%%%%%%%%%%%%
H= imread('zftjh.jpg'); %��ȡͼƬ

if length(size(H))>2 %�ж��Ƿ�Ϊ��ͨ����ɫͼƬ ���� ����ҶȻ�
    H=rgb2gray(H);  %�ҶȻ�
end
subplot(3,2,1);  
imshow(H); title('ԭͼ');  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [width,height,bmsize]=size(H);%��ȡͼƬ�ߴ�
% W=uint8(zeros(width,height));%zeros(2*3)������һ��2*3�ľ���,����һ���հ�ͼ
% R=H(:,:,1);
% G=H(:,:,1);
% B=H(:,:,1);
% H=R.*0.299+G.*0.587+B.*0.114;%���������Ҫ��.*  
% subplot(3,2,1);  
% imshow(H);
% title('ԭͼ');
% imshow(H);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,2,2);  
imhist(H); title('ԭͼֱ��ͼ');  
subplot(3,2,3);  
H1=adapthisteq(H);  
imshow(H1); title('adapthisteq�����ͼ');  
subplot(3,2,4);  
imhist(H1);title('adapthisteq�����ֱ��ͼ');  
subplot(3,2,5);  
H2=histeq(H);  
imshow(H2); title('histeq�����ͼ');  
subplot(3,2,6);  
imhist(H1); title('histeq�����ֱ��ͼ'); 





%%%%%%%%%%�Լ���дֱ��ͼ���⻯�Ĵ���%%%%%%%%%%%%%
H= imread('zftjh.jpg'); 

%�ж��Ƿ�Ϊ��ͨ����ɫͼƬ ���� ����ҶȻ�
if length(size(H))>2
    H=rgb2gray(H);  
end
figure;
subplot(2,2,1);  
imshow(H);  
title('ԭͼ');  

%��ȡͼƬ�ĳߴ� ���ڼ����������� ��m*n 
[m,n]=size(H);  
%����һ��һ��256�е�һά����
p=zeros(1,256);  
% ͳ�Ƹ��Ҷȵ����ظ��� 
%find(H==i) ����ͼ���������Ѱ�һҶ�Ϊi�ĵ����� 
% ��Ϊ�����Ǵ�1��ʼ�� ����Ϊp(i+1) 
%p�Ǽ���ÿ����ĸ���
for i=0:255  
    
  p(i+1)=length(find(H==i))/(m*n);  

end  
subplot(2,2,2);  
% ��ʾԭͼ��ֱ��ͼ
bar(0:255,p,'b');  
title('ԭͼֱ��ͼ');  
 

 % ����ѭ�� �ۼӸ���ֵ
s=zeros(1,256);  %����һ����1��256����0���顣
for i=1:256  
     for j=1:i  
         s(i)=p(j)+s(i); %������һ���µ�һά����s                 
     end  
end  

%��s�е����ȳ���255����ȡ��   
 a=round(s*255);   % round��ȡ������ �����������ֵ��0-1�ĸ�����չ��0-255,
b=H;  
%����ԭͼ��ĻҶ�
for i=0:255  
     b(find(H==i))=a(i+1);  %�ı�b�е����ص�ֵ�ҵ�b�д������100������λ�ã�������Ϊa101��Ӧ������ֵ        
end
subplot(2,2,3);  
imshow(b)                            
title('���⻯��ͼ��');  

 %ͳ�Ƹ��º�ĸ���  �����ʽ����ۼ�
for i=0:255  
    GPeq(i+1)=sum(p(find(a==i)));            
end  
subplot(2,2,4);  
bar(0:255,GPeq,'b'); title('���⻯���ֱ��ͼ'); 

