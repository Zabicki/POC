close all;clearvars;clc;
 
fale = imread('dwieFale.bmp');
kolo = imread('kolo.bmp');
kwadrat = imread('kwadrat.bmp');
kwadrat45 = imread('kwadrat45.bmp');
trojkat = imread('trojkat.bmp');
 
fourier(fale);
fourier(kolo);
fourier(kwadrat);
fourier(kwadrat45);
fourier(trojkat);
 
figure
img = fale;
F1 = fft(img,[],1);
F2 = fft(F1, [], 2);
subplot(2,1,1)
imshow(fft2(img));
subplot(2,1,2)
imshow(F1);