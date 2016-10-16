clear all
clc

format long

rng('default');

n = 10000000; % amount of random numbers used
points_inside = 0;

for i=1:1:n
   %generate (x,y) coordinate
   x = rand();
   y = rand();
   
   %determine if (x,y) is within unit circle
   if(sqrt(x^2+y^2) <= 1)
       points_inside = points_inside+1; 
   end
end

%calculate pi
pi = 4*points_inside/n;