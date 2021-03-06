clearvars;
clc;
close all;

dom = imread('dom.png');
image = dom;

detection1 = edge(image, 'log');
figure;
imshow(detection1);
title('LoG');

detection2 = edge(image, 'canny');
figure;
imshow(detection2);
title('canny');

detection3 = edge(image, 'sobel');
figure;
imshow(detection3);
title('sobel');