## matlab-image-processing

# Usage Example 
```
clear all
clc

im = imread('90_R0.PNG');
imbin = imbinarize(im);

% imshow(im)
figure('Name','Binary Image - Original')
imshow(imbin)

% get projections
[h,v] = getProjections(imbin);

% get center and area, show center of obj
[area, xc, yc] = getSizeAndCenter(imbin);

% create run length encoded image, save it as a txt file
createEncodedFile(imbin, 'encoded.txt');

% decode run len encoded txt
imDecoded = derunlen(imbin, 'encoded.txt');

% image signiture
imsign = getSigniture(imbin);

% dilation & erosion
se = [1 1 1];
dilated = dilation(imbin, se);
eroded  = erosion(dilated, se);

figure('Name','First dilate, then erode')
imshow(eroded)

% external boundary
boundary = externalBoundary(imbin,se);
```
