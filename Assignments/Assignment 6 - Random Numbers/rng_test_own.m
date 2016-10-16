% Written by Alex Aalbertsberg
% s1008129

% Test bench for exercise 2 using self-made RNG.

[vec,vec2] = rng_init(10,1);
avgone = mean(vec2);
stdone = std(vec2);

[vec,vec2] = rng_init(10,10);
avgten = mean(vec2);
stdten = std(vec2);

[vec,vec2] = rng_init(10,100);
avghundred = mean(vec2);
stdhundred = std(vec2);

[vec,vec2] = rng_init(10,1000);
avgthousand = mean(vec2);
stdthousand = std(vec2);

[vec,vec2] = rng_init(10,10000);
avgtenthousand = mean(vec2);
stdtenthousand = std(vec2);

[vec,vec2] = rng_init(10,100000);
avghundredthousand = mean(vec2);
stdhundredthousand = std(vec2);

[vec,vec2] = rng_init(10,1000000);
avgmillion = mean(vec2);
stdmillion = std(vec2);

[vec,vec2] = rng_init(10,10000000);
avgtenmillion = mean(vec2);
stdtenmillion = std(vec2);