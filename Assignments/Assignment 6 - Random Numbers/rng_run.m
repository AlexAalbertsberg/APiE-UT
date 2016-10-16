% Written by Alex Aalbertsberg
% s1008129

% Test bench for exercise 1.

[vec,vec2] = rng_init(10,2^15);

period = unique(vec)
minimum = min(vec)
maximum = max(vec)