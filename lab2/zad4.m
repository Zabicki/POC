clearvars;
close all;
clc;

lena = imread('lena.bmp');
lena = imresize(lena, [128 128]);
lena1 = imadjust(lena,[], [0 31/255]);
lena2 = imadjust(lena,[], [0 15/255]);
lena3 = imadjust(lena,[], [0 7/255]);
lena4 = imadjust(lena,[], [0 3/255]);
lena5 = imadjust(lena,[], [0 1/255]);

subplot(2,3,1)
imshow(lena);

subplot(2,3,2)
imshow(lena1, []);

subplot(2,3,3)
imshow(lena2, []);

subplot(2,3,4)
imshow(lena3, []);

subplot(2,3,5)
imshow(lena4, []);

subplot(2,3,6)
imshow(lena5, []);