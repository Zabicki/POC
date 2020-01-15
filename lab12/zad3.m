clearvars;
close all;
clc;

Img = imread('shapes.png');
Img_src = Img;

Img = bwlabel(Img,4);

figure;
subplot(1, 3, 2);
imshow(Img, []);
title('po indeksacji');

wsp = obliczWspolczynniki(Img);
[Y, X] = size(Img);

for J = 1:Y
    for I = 1:X
        piksel = Img(J, I);
        if piksel ~= 0 && ~(wsp(piksel, 2) > 0.33 && wsp(piksel, 2) < 0.66)
            Img(J, I) = 0;
        end
    end
end

subplot(1, 3, 1);
imshow(Img_src, []);
title('shapes');

subplot(1, 3, 3);
imshow(Img, []);
title('krzyzyki');

%
Img = imread('shapesReal.png');

imageSrc = Img;

IBW = im2bw(Img, 0.22);
IC = imcomplement(IBW);
element_str = strel('rectangle', [5 5]);
Ierode = imerode(IC, element_str);

imageBW = bwlabel(Ierode, 4);

wsp = obliczWspolczynniki(imageBW);
[Y, X] = size(imageBW);

for J = 1:Y
    for I = 1:X
        piksel = imageBW(J, I);
        if piksel ~= 0 && ~(wsp(piksel, 2) > 0.50x && wsp(piksel, 2) < 0.66)
            imageBW(J, I) = 0;
        end
    end
end

figure;

subplot(1, 3, 1);
imshow(imageSrc, []);
title('original');

subplot(1, 3, 2);
imshow(Ierode);
title('binarized');

subplot(1, 3, 3);
imshow(imageBW, []);
title('krzyzyki');