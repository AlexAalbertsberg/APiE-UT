% Written by Alex Aalbertsberg
% s1008129

function [vec, vec2] = rng_init(seed,M)
%RNG_INIT Main routine for the linear RNG.
% Parameter "seed" defines the starting number of the RNG.
% Paramter "M" defines the total amount of numbers to be generated.

    p = 2^15 - 1;
    % multiplier for the RNG
    c = 171;

    % preallocate vectors of length M.
    vec = zeros(M,1);
    vec2 = zeros(M,1);
    
    % set vector's first element to the value of the seed.
    vec(1) = seed;
    % set vector's first element to the weighted value of the seed.
    vec2(1) = seed/p;
    
    % generate M-1 pseudorandom numbers
    for i = 2:1:M
       vec(i) = rng_irand(vec(i-1),p,c);
       vec2(i) = rng_rand(vec(i-1),p,c);
    end
end