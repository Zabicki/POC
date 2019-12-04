clearvars;
close all;
clc;

I = imread('clock.bmp');
xReScale = 1.5;
yReScale = 1.5;

[YY,XX] = size(I);
nYY = YY * round(yReScale);
nXX = XX * round(xReScale);

nI = uint8(zeros(nYY,nXX));

yStep = YY/nYY;
xStep = XX/nXX;

figure(1)
imshow(I);

image = I;

for ii = 0:nYY-1
    for jj = 0:nXX - 1
        y = round(ii * yStep);
        x = round(jj * xStep);
        
        if(y > YY - 1)
            y = YY - 1;
        end
        if(x > XX - 1)
            x = XX - 1;
        end
        
        nI(ii + 1, jj + 1) = image(y + 1, x + 1);
    end
end

figure(2)
imshow(nI);