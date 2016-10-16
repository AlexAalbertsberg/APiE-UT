clear all 
clc

[vec, vec2] = rng_init(10,100);

%perform chi square goodness of fit test
[h,p] = chi2gof(vec);