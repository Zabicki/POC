close all; clearvars; clc;

i1 = imread('knee.png');

figure;
imshow(i1)

[y, x] = ginput(1);
x = floor(x);
y = floor(y);
i1 = double(i1);

[x_size, y_size] = size(i1);

visited = zeros(x_size, y_size);
segmented = zeros(x_size, y_size);
stack = zeros(10000, 2);
iStack = 1;

visited(x, y) = 1;
segmented(x, y) = 1;
stack5(iStack, 1) = x;
stack(iStack, 2) = y;
nS = 0;
mV = 0;

while iStack > 0
   px = stack(iStack, 1);
   py = stack(iStack, 2);
   iStack = iStack - 1;
   nS = nS + 1;
   mV = (mV * (nS - 1) + i1(px, py)) / nS;
   
   if px > 1 && px < x_size && py > 1 && py < y_size
        for ix = px-1:px+1
            for iy = py-1:py+1
                if ix~=px && iy~=py && visited(ix,iy)==0 && ((abs(i1(ix,iy) - mV)) < 30)
                    iStack=iStack+1;
                    stack(iStack, :) = [ix, iy];
                    segmented(ix,iy) = i1(ix,iy);
                elseif ix==px && iy==py
                    segmented(ix,iy) = i1(ix,iy);
                end
                visited(ix,iy)=1;
            end
        end    
   end
end

figure;
imshow(segmented,[]);