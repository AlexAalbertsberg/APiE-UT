clear all
clc

format long

rng('default');

n = 10000000; % amount of random numbers used
points_inside = 0;

for i=1:1:n
   %generate (x,y,z)
   x = rand();
   y = rand();
   z = rand();
   
   %determine if (x,y,z) is within unit sphere
   if(x^2+y^2+z^2 <= 1)
       points_inside = points_inside+1; 
   end
end

%calculate pi
pi = 6*points_inside/n;