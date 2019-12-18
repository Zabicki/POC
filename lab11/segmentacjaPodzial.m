clear; clc; close all;

global sLimit vLimit MRes segRes index;

i1 = imread('umbrealla.png');

colorThreshold = 5/255;
minAreaSize = 27;

figure;
imshow(i1, []);
title('original image');
 
i1HSV = rgb2hsv(i1);
i1H = double(i1HSV(:,:,1));

figure;
imshow(i1H, []);
title('H vector');

sLimit = 4;
vLimit = 0.05;
index = -1;

[y, x] = size(i1H);

segRes = zeros(y, x);
MRes = zeros(y, x);

split(i1H, 1, 1, x, y);

i = 0;
while i <= index
   IB = segRes == i;
   
   if any(IB(:))
       [yF, xF] = find(IB, 1, 'first');
       
       square = strel('square', 3);
       neighbors = imdilate(IB, square);
       diff = imabsdiff(neighbors, IB);
       pointMult = diff .* segRes;
       nonZeros = nonzeros(pointMult);
       uniqued = unique(nonZeros);
       
       isJoined = 0;
       for neighbor = 1:numel(uniqued)
           IBS = segRes == uniqued(neighbor);
           
           [yFS, xFS] = find(IBS, 1, 'first');
           
           colorDiff = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if colorDiff < colorThreshold
               segRes(IBS) = i;
               isJoined = 1;
           end
       end
       if isJoined == 0
          i = i + 1;
       end
   else
       i = i + 1;
   end
end

figure;
imshow(segRes,[]);

U = unique(segRes);

for ix = 1:numel(U)
    C = segRes == U(ix);
    if sum(C) < minAreaSize
       segRes(C) = 0; 
    end
end

U = unique(segRes);

for ix = 1:numel(U)
    C = segRes == U(ix);
    segRes(C) = ix;
end

finalImage = label2rgb(segRes);

figure;
imshow(finalImage);
