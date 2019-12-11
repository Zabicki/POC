close all;
clearvars;
clc;
dom = imread("dom.png");
lab112 = imread("lab112.png");
img = dom;
imshow(img);
figure();
img = im2bw(img,50/255);
imshow(img);
figure();
SE = strel('square',7);
img = imclose(img,SE);
imshow(img);
img = edge(img,'log',0.30,0.400);
figure();
imshow(img)
[H,T,R] = hough(img);
peaks = houghpeaks(H,8);
imgorg = img;
lines = houghlines(img,T,R,peaks,'FillGap',5,'MinLength',7);
figure, imshow(imgorg), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
 
   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
figure();
img = imread("dom.png");
imgk = edge(img,'canny',0.4,0.4);
[H,T,R] = hough(imgk);
imshow(H,[]);
hold on;
peaks = houghpeaks(H,7);
plot(peaks(:,2),peaks(:,1),'o');