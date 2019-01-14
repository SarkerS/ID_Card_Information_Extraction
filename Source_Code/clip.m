function imgn=clip(imagen)
if ~islogical(imagen)
    imagen=im2bw(imagen,0.00);
end
a=~imagen;
%imshow(a);
%pause(1);
[f c]=find(a);
lmaxc=max(c);
lminc=min(c);
lmaxf=max(f);
lminf=min(f);
imgn=a(lminf:lmaxf,lminc:lmaxc);%Crops image
%imshow(imgn); Pause(1);

