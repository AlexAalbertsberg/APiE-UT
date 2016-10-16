% get_neighbors.m
% Function that allows for the retrieval of neighbor cells in Exercise 1 of
% Image Analysis - APiE
% Written by: Alex Aalbertsberg (s1008129)


function [ neighbors ] = get_neighbors( mat, i,j )

neighbors = [];

if(i > 1)
    if(j > 1)
        %top left
        neighbors = [neighbors mat(i-1,j-1)];
    end
    %top
    neighbors = [neighbors mat(i-1,j)];
    if(j < size(mat,2))
        %top right
        neighbors = [neighbors mat(i-1,j+1)];
    end
end
if(j > 1)
    %left
    neighbors = [neighbors mat(i,j-1)];
end
if(j < size(mat,2))
    %right
    neighbors = [neighbors mat(i,j+1)];
end

if(i < size(mat,1))
    if(j > 1)
        %bottom left
        neighbors = [neighbors mat(i+1,j-1)];
    end
    %bottom
    neighbors = [neighbors mat(i+1,j)];
    if(j < size(mat,2))
        %bottom right
        neighbors = [neighbors mat(i+1,j+1)];
    end
end

% remove all pixels that have no region number, because they do not matter
neighbors(neighbors==0) = [];
neighbors(neighbors==255) = [];

end

    