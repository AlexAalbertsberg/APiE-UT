% Written by Alex Aalbertsberg
% s1008129

function [x] = rng_irand(x,p,c)
%RNG_IRAND Returns a pseudorandom number between 0 and p
%   This function returns a pseudorandom number between 0 and p based on
%   the formula x(i+1) = (c * x(i)) mod p
%   
%   where x(i+1) is the next random number in the sequence
%   x(i) is the latest random number
%   c is the multiplier
%   p is the maximum number allowed

    x = mod((c*x),p);

end

