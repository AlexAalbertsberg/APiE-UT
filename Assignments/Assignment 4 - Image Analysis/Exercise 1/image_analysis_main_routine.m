% image_analysis_main_routine.m
% Main route for Exercise 1 of Image Analysis - APiE
% Written by: Alex Aalbertsberg (s1008129)

clear all
clc

% read RGB data from png file
A = imread('pictures\bladcellen.png');

% convert color image to grayscale
I = rgb2gray(A);


% apply Otsu's method to find threshold with lowest class variance
[threshold] = otsu(I);


% apply two-pass algorithm
L = twopass(I, threshold);

% count regions
answer = numel(unique(L(:)));


% calculate area
uniqueL = unique(L(:));

% remove elements in regions that touch the border of the image
% horizontal edges
for i=1:1:size(L,1)
    uniqueL(uniqueL == L(i,1)) = [];
    uniqueL(uniqueL == L(i,size(L,2))) = [];
end
% vertical edges
for i=1:1:size(L,2)
    uniqueL(uniqueL == L(1,i)) = [];
    uniqueL(uniqueL == L(size(L,1),i)) = [];
end

% count pixels for each remaining region to get their area
areas = zeros(size(uniqueL,1),2);
for i=1:1:size(uniqueL(:))
   areas(i,:) = [uniqueL(i) numel(L(L == uniqueL(i)))]; 
end

% Show original image to draw fitted ellipses over
figure
imshow(A);

% table containing:
% Area of each cell
% Center of mass of each cell (Centroid)
% Eccentricity
% Means to calculate major/minor axes of fitted ellipse (Orientation,
% Centroid, MajorAxisLength and MinorAxisLength).
s = regionprops(L, 'Area', 'Centroid', 'Orientation', 'MajorAxisLength', 'MinorAxisLength', 'Eccentricity');

%length of major/minor axes of fitted ellipse
for i=1:1:size(s(:))
   xMajor = s(i).Centroid(1) + [-1 1]*(s(i).MajorAxisLength/2)*cosd(s(i).Orientation);
   yMajor = s(i).Centroid(2) - [-1 1]*(s(i).MajorAxisLength/2)*sind(s(i).Orientation);
   
   xMinor = s(i).Centroid(1) + [-1 1]*(s(i).MinorAxisLength/2)*sind(s(i).Orientation);
   yMinor = s(i).Centroid(2) + [-1 1]*(s(i).MinorAxisLength/2)*cosd(s(i).Orientation);
   
   line(xMajor,yMajor);
   line(xMinor,yMinor);
end