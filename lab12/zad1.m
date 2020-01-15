clearvars;
close all;
clc;


C_org = imread('ccl1.png');
C1 = C_org;

figure;
subplot(3, 1, 1);
imshow(C_org);
title('original');

[ySize, xSize] = size(C1);
L = 1;
N = 100;
id = 1:N;

% etap 1

for i = 2:ySize
   for j = 2:xSize - 1
      if C1(i, j) ~= 0
         neighbors = [C1(i-1, j-1) C1(i-1, j) C1(i-1, j+1) C1(i, j-1)];
         
         if sum(neighbors) == 0
             C1(i, j) = L;
             L = L + 1;
         else
             neighbors_nz = nonzeros(neighbors);
             minN = min(neighbors_nz);
             maxN = max(neighbors_nz);
             
             if minN == maxN
                 C1(i, j) = minN;
             
             else
                 id = union(minN, maxN, id);
                 C1(i, j) = minN;
                 
             end
         end
      end
   end
end

subplot(3, 1, 2);
imshow(label2rgb(C1), []);
title('first pass');

lut = id;

for i = 1:numel(id)
    lut(i) = root(id(i), id);
end

% etap 2

C2 = C1;

for i = 1:ySize
   for j = 1:xSize
      if C2(i, j) ~= 0
         C2(i, j) = lut(C1(i, j));
      end
   end
end

subplot(3,1, 3);
imshow(label2rgb(C2), []);
title('second pass');


function new_index = root(index, arr)
    new_index = index;
    while arr(new_index) ~= new_index
       new_index = arr(new_index);
    end
end


function result = union(p, q, arr)
    result = arr;
    result(root(p, arr)) = root(q, arr);
end