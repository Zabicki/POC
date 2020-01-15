close all;
clearvars;
clc;
img = imread('umbrealla.png');
[X, Y, Z] = size(img);
imshow(img);
img = double(rgb2hsv(img));
mean_threshold = 5/255;
size_threshold = 10;
global segRes;
global index;
global mRes;
index = 1;
segRes = zeros(X,Y);
mRes = zeros(X,Y);
vc = img(:,:,1);
split(vc,1,X,1,Y);
i=0;
connections=0;
figure();
imshow(segRes,[]);
while(i<index)
    IB = segRes == i;
    if(sum(IB(:)) == 0)
        i = i+ 1;
        continue;
    end
    [yF,xF] = find(IB,1,'first');
    IBdilated = imdilate(IB,strel('square',3));
    IBdiff = imabsdiff(IBdilated, IB);
    maskMul = IBdiff.*segRes ;
    neighboursIndexes = unique(nonzeros(maskMul));
    connectFlag = 0;
    for j = 1:length(neighboursIndexes)
        JB = segRes == neighboursIndexes(j);
        [yG,xG] = find(JB,1,'first');
        if(abs(mRes(yG,xG)-mRes(yF,xF))<mean_threshold)
            segRes(JB) = i;
            connectFlag = 1;
            connections = connections+1;
        end
    end
    if(connectFlag == 0)
        i = i+ 1;
    end    
end
 
figure;
imshow(segRes,[]);
U = unique(segRes);
for i = 1:size(U)
    IB = segRes == U(i);
    sm = sum(IB);
    if(size_threshold>sm)
        segRes(IB) = 0;
    end
end
 
figure();
imshow(segRes,[]);
U = unique(segRes);
for i = 1:size(U)
    IB = segRes == U(i);
    segRes(IB) =  i+3;
end
figure;
imshow(label2rgb(segRes));