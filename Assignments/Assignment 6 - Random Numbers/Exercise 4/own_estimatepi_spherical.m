clear all
clc

format long

n = 100000000; % amount of random numbers used
points_inside = 0; % variable for determining the amount of points that fall within the sphere

latest = 3;
for i=1:1:n
   %generate (x,y,z) coordinate
   x = rng_rand(latest,171,2^15);
   y = rng_rand(x,171,2^15);
   z = rng_rand(y,171,2^15);
   
   latest = z*2^15;
   
   %determine if (x,y,z) is within unit sphere
   if(x^2+y^2+z^2 <= 1)
       points_inside = points_inside+1; 
   end
end

% calculate pi
pi = 6*points_inside/n;