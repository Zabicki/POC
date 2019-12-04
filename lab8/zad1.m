close all;
clearvars;
clc;
 
load('MR_data.mat')
 
img = I_noisy1;
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy1')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],20,1), []); title('Filtred (bilateral)');
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy1')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],2,0), []); title('Filtred (normal)');
 
img = I_noisy2;
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy2')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],20,1), []); title('Filtred (bilateral)');
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy2')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],2,0), []); title('Filtred (normal)');
 
img = I_noisy3;
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy3')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],20,1), []); title('Filtred (bilateral)');
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy3')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],2,0), []); title('Filtred (normal)');
 
img = I_noisy4;
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy4')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],20,1), []); title('Filtred (bilateral)');
 
figure()
subplot(1, 2, 1)
imshow(img, []); title('Original - noisy4')
subplot(1, 2, 2)
imshow(bilateral_fit(img, [5 5],2,0), []); title('Filtred (normal)');