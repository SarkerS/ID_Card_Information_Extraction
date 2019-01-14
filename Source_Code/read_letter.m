function letter=read_letter(imagn)
%Computes the correlation between template and input image
%Size of 'imagn' is 42 x 24 pixels

% imagn=imread('D.bmp');
% letter=read_letter(imagn)
[x y] = size(imagn);
white_points = 0;
black_points = 0;

for a = 1:1:x
    for b = 1:1:y
        if(imagn(a,b)==1)
            white_points = white_points+1;
        else
            black_points = black_points+1;
        end
    end
end

if(black_points <=550)
comp=[];
load Number_template
for n=1:10
    sem=corr2(templates{1,n},imagn);
    comp=[comp sem];
end
vd=find(comp==max(comp));
%-------------------------------
if vd==1
    letter='1';
elseif vd==2
    letter='2';
elseif vd==3
    letter='3';
elseif vd==4
    letter='4';
elseif vd==5
    letter='5';
elseif vd==6
    letter='6';
elseif vd==7
    letter='7';
elseif vd==8
    letter='8';
elseif vd==9
    letter='9';
else vd==10
    letter='0';
    
        
end
else
    letter = '-';
    sprintf('%d',black_points);
end
