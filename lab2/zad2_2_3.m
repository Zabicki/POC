clearvars;
close all;
clc;

parrot = imread('parrot.bmp');
chessboard = imread('chessboard.bmp');
clock = imread('clock.bmp');

image = clock;

figure(1)
imshow(imresize(image, 1.5, 'nearest'));
figure(2)
imshow(imresize(image, 1.5, 'bilinear'));
figure(3)
imshow(imresize(image, 1.5, 'bicubic'))