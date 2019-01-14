%-------------input-------------------------------
srcFiles = dir('C:\Users\SiBeNDu\Desktop\Source_Code\id*.jpg');
n=length(srcFiles);
for srl = 1 : n
  filename = strcat('C:\Users\SiBeNDu\Desktop\Source_Code\',srcFiles(srl).name);
%---------------------------------------------------- 
warning off;
img = imread(filename);%imshow(img);
%-------------Resize the image-----------
img=imresize(img,[741 1188]);

%-------face detection--------------
v=vision.CascadeObjectDetector;
u=step(v,img);
figure;
imshow(img);

%hold on;
title ('Student Face');
for i=1:size(u,1)
rectangle('Position',u(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');

pause(1);
end
%--------------Crop the image of student-----------------
for i = 1:size(u,1)

 J= imcrop(img,u(i,:));
 h=figure;
 imshow(J);
pause(1);
 end

%hold off;


%----------Crop the image for id -----------
img=imcrop(img,[580,680,580,1000]);
img = rgb2gray(img); %rgbto gray
level = graythresh(img); %computes the global threshold
p = im2bw(img,level); %gray to black and white

%------------Filter Image Noise----------
if length(size(p))==3 %RGB image
    p=rgb2gray(p);
end
p = medfilt2(p);
[f c]=size(p);
p (1,1)=255;
p (f,1)=255;
p (1,c)=255;
p (f,c)=255;
%--------------END Filter Image Noise-----------
q=[];%Storage matrix q from image
s=p;
fileid = fopen('C:\Users\SiBeNDu\Desktop\Source_Code\Student_info\log.txt', 'at');
for i=1:s
   [r s]=lines(s);%Fcn 'lines' separate lines in text
    t=~r;
    
  %imshow(r);pause(1)

%-------------Calculating connected components-----------
    L = bwlabel(t);
    mx=max(max(L));
    BW = edge(double(t),'sobel');
    [imx,imy]=size(BW);
    for n=1:mx
        [r,c] = find(L==n);
        rc = [r c];
        [sx sy]=size(rc);
        n1=zeros(imx,imy);
        for i=1:sx
            x1=rc(i,1);
            y1=rc(i,2);
            n1(x1,y1)=255;
        end
%---------------END Calculating connected components------------
       
        n1=~n1;
        n1=~clip(n1);
        img_r=same_dim(n1);%Transf. to size 42 X 24
        
        %imshow(img_r);pause(1)
        letter=read_letter(img_r);%img to text
        q=[q letter]; 
    end
    msgbox(sprintf('Student Image and ID Extraction successful.\nExtracted Student ID: %s .',q),'Extraction Success');
    hold on;
    fprintf(fileid,'Serial no:- %d \nStudent ID:-%s\nDate:-%s\n',srl,q,date);%Write 'word' in text file (upper)
    fprintf(fileid,'------------------------------------\n');
  
    saveas(h,['C:\Users\SiBeNDu\Desktop\Source_Code\Student_info\id',num2str(q),'.jpg']);
    q=[ ];
    hold off;
%------------When the sentences finish, breaks the loop----------
    if isempty(s)   
        break;
   
    end
  
end
 fclose(fileid);
end
