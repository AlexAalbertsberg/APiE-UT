% Written by Alex Aalbertsberg
% s1008129

function x = rng_rand(x,p,c)
%RNG_RAND Returns a pseudorandom number between 0 and 1
%   This function returns a pseudorandom number between 0 and 1 based on
%   the formula x(i+1) = (c * x(i)) mod p
%   
%   where x(i+1) is the next random number in the sequence
%   x(i) is the latest random number
%   c is the multiplier
%   p is the maximum number allowed
%
%   In order to get the number between 0 and 1, we divide the result of
%   this formula by p.

    x = (mod((c*x),p))/p;

end

