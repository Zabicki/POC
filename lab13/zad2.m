close all;
clc;
clearvars;

lena = imread('lena.bmp');
fimage = fft2(lena);
shifted = fftshift(fimage);
%fourier(lena);

[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd(r>0.2) = 0;

%wizualizacja filtra
%colormap(jet(64));
%mesh(f1,f2,Hd);


filtered = shifted.*Hd;
filtered = ifftshift(filtered);
filtered = ifft2(filtered);

figure;
imshow(uint8(filtered));
title('Filtered image');

h = fwind1(Hd, hanning(21));

[H, f1, f2] = freqz2(h, 512, 512);
mesh(f1, f2, H);

filtered2 = shifted .* H;
filtered2 = uint8(ifft2(ifftshift(filtered2)));
figure;
imshow(filtered2);

%% Gaussian Filter
[width, height] = size(image);
sigma = 10;
mask = fspecial('gaussian', width, sigma);

% to grayscale
mask = mat2gray(mask);

figure;
imshow(mask);

% filtrowanie
fouriered = fft2(lena);
shifted = fftshift(fouriered);
filtered3 = shifted .* mask;

% odwracanie fouriera
filtered3 = uint8(ifft2(ifftshift(filtered3)));

figure;
imshow(filtered3);