% ex2.m
% Exercise 2 of Image Analysis - APiE
% Written by: Alex Aalbertsberg (s1008129)

clear all
clc

% read pattern images
p1 = imread('pictures\pattern1.tif');
p2 = imread('pictures\pattern2.tif');

% apply autocorrelations of both patterns (correlation to themselves)
c1 = xcorr2impl(p1,p1);
c2 = xcorr2impl(p2,p2);

%plot autocorrelation of pattern 1
figure
surf(c1)
title('Cross correlation of pattern 1 and itself')
shading flat

%plot autocorrelation of pattern 2
figure
surf(c2)
title('Cross correlation of pattern 2 and itself')
shading flat

% calculate cross correlation of pattern 1 and 2
c3 = xcorr2impl(p1,p2);

% plot cross correlation of pattern 1 and 2
figure
surf(c3)
title('Cross correlation of pattern 1 and pattern 2')
shading flat


% calculation of displacement/offset by using result of cross correlation
[max_c, imax] = max(abs(c3(:)));
[ypeak, xpeak] = ind2sub(size(c3),imax(1));

corr_offset = round([(xpeak-(size(c3,2)+1)/2) (ypeak-(size(c3,1)+1)/2)]);

% There is no displacement to be found when not using normalized cross
% correlation?
xoffset = corr_offset(1);
yoffset = corr_offset(2);

c4 = normxcorr2(p1,p2);

[max_c, imax] = max(abs(c4(:)));
[ypeak, xpeak] = ind2sub(size(c4),imax(1));

corr_offset = round([(xpeak-(size(c4,2)+1)/2) (ypeak-(size(c4,1)+1)/2)]);

% When using normalized cross correlation, there is a displacement to be
% found!
normxoffset = corr_offset(1);
normyoffset = corr_offset(2);
