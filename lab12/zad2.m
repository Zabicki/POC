clearvars;
close all;
clc;

I = imread('ccl2.png');

figure;

subplot(1, 3, 1);
imshow(I, []);
title('Oryginalny');

I_after_4 = bwlabel(I, 4);

subplot(1, 3, 2);
imshow(I_after_4, []);
title('4 elementowe');

I_after_8 = bwlabel(I, 8);

subplot(1, 3, 3);
imshow(I_after_8, []);
title('8 elementowe');