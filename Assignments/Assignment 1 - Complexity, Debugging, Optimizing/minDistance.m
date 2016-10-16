function d = minDistance(x,y,z)
% Given a set of 3D points specified by column vectors x,y and z, this
% function computes the minimum distance to the origin

% append column vectors to each other to create matrix M.
M = [x,y,z];

% check if matrix M has dimensions 3xN. If not, return an error.
if(size(M,2) ~= 3)
    error('matrix must have dimensions 3xN')
end

% square all individual elements in the matrix.
M = M.^2;

nPoints = size(M,1);

% get all column sums
sums = sum(M,2);

% preallocate
d = zeros(nPoints,1);

% compute distance for every point
for k = 1:nPoints
    d(k) = sqrt(sums(k));
end
% get minimum distance
d = min(d)
