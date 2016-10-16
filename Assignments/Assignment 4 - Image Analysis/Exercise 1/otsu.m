% otsu.m
% Function to implement Otsu's method for Image Analysis - APiE
% Written by: Alex Aalbertsberg (s1008129)


function [bestthreshold] = otsu(I)

    % calculate total amount of pixels in the image
    totalpixels = numel(I);

    % for each possible threshold (from lowest value pixel to highest)
    for threshold=min(I(:)):1:max(I(:))


        lowernumel = 0;
        totallower = 0;
        uppernumel = 0;
        totalupper = 0;

        % for each pixel get the value and check if it is above or below the
        % current threshold
        for i=1:1:totalpixels
            asdf = double(I(i));
            if(I(i) < threshold)
                lowernumel = lowernumel + 1;
                totallower = totallower + asdf;
            else
                uppernumel = uppernumel + 1;
                totalupper = totalupper + asdf;
            end
        end

        %calculate weights for foreground and background
        wfore = uppernumel/totalpixels;
        wback = lowernumel/totalpixels;

        %calculate means for foreground and background
        mfore = totalupper/uppernumel;
        mback = totallower/lowernumel;

        % initialize variances
        uppervariance = 0;
        lowervariance = 0;

        %for all pixels below threshold add to lower variance
        for i=min(I(:)):1:threshold-1
           i = double(i);
           dev = (i-mback)^2;
           ct = sum(I(:) == i);
           lowervariance = lowervariance + ct*dev;
        end

        % for all pixels above threshold add to upper variance
        for i = threshold:1:max(I(:))
           i = double(i);
           dev = (i-mfore)^2;
           ct = sum(I(:) == i);

           uppervariance = uppervariance + ct*dev;
        end

        % calculate total variances
        lowervariance = lowervariance/lowernumel;
        uppervariance = uppervariance/uppernumel;

        % calculate class variance for current threshold
        classvariance = lowervariance*wback+uppervariance*wfore;

        % if current threshold's class variance is lower than the lowest
        % variance so far, make this threshold the new best threshold
        if ( (exist('lowest_variance','var') == 0 || classvariance < lowest_variance) && ~isnan(classvariance))
            lowest_variance = classvariance;
            bestthreshold = threshold;
        end
    end
end

