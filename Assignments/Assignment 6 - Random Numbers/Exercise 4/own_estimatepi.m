clear all
clc

format long

n = 100000000; % amount of random numbers used
points_inside = 0; 

latest = 3;
for i=1:1:n
   %generate (x,y) coordinate    
   x = rng_rand(latest,171,2^15);
   y = rng_rand(x,171,2^15);
   
   latest = y*2^15;
   
   %determine if (x,y) is within unit circle
   if(sqrt(x^2+y^2) <= 1)
       points_inside = points_inside+1; 
   end
end

%calculate pi
pi = 4*points_inside/n;