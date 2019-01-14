one=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\1.bmp'); 
two=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\2.bmp');
three=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\3.bmp');
four=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\4.bmp');
five=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\5.bmp');
six=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\6.bmp');
seven=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\7.bmp');
eight=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\8.bmp');
nine=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\9.bmp'); 
zero=imread('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\templates\0.bmp');
number=[one two three four five six seven eight nine zero];

templates=mat2cell(number,42,[24 24 24 24 24 24 24 24 24 24]);

save ('C:\Users\SiBeNDu\Google Drive\U of M [2016 to 2018]\Academic\Fall16\Image\Project\COMP 7960 Project\Number_template.mat','templates')
msgbox('Template creation successful','Template ');