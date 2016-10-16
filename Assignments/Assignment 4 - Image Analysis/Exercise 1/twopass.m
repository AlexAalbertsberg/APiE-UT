% twopass.m
% Two pass algorithm for Image Analysis - APiE
% Written by: Alex Aalbertsberg (s1008129)


function [L] = twopass(B, threshold)
    %make foreground black, background white.
    for i=1:1:size(B(:))
       if(B(i) < threshold)
          B(i) = 255; 
       else
          B(i) = 0;
       end   
    end

    label = 1; %section label

    L = zeros(size(B,1), size(B,2), 'uint32');

    eq = zeros(1,10000);
    % set all 0 values to arbitrarily high number
    eq(eq==0) = 12312313213123;

    %first pass
    for i=1:1:size(B,1)
        for j=1:1:size(B,2)
           if(B(i,j) == 255)
               % get neighbors for current pixel
               neighbors = get_neighbors(L, i,j);

               % if there are no neighbors with a label
               if(size(neighbors,2) == 0)
                   % set label on current pixel
                   L(i,j) = label;
                   % increment label
                   label = label + 1;
               % if there are neighbors with a label
               else
                   % set value to lowest neighboring label value
                   L(i,j) = min(neighbors(:));
                   % if there are multiple neighbors store equivalences
                   if(size(neighbors(neighbors~=0),2)>1)
                       eq(max(neighbors(:))) = min(eq(max(neighbors(:))), min(neighbors(:)));
                   end
               end
           end
        end
    end

    % re-set arbitarily high label
    eq(eq==12312313213123) = 0;

    % second pass
    for i=1:1:size(L,1)
        for j=1:1:size(L,2)
            % for each pixel with a label (>0)
            if(L(i,j) > 0)
                % find equivalences for label values and lower the value of
                % current pixel to the equivalent.
                while(eq(L(i,j)) > 0 && eq(L(i,j)) ~= L(i,j))
                    L(i,j) = eq(L(i,j));
                end
            end
        end
    end

    %leave out any region below 50 pixels size
    for i=1:1:max(eq(:))
        if(sum(L(:) == i) < 50)
            L(L == i) = 0;
        end
    end

end

