clear all
clc

rng('default');

vec = randi(2^15-1, [100 1]);

%perform chi square goodness of fit test
[h,p] = chi2gof(vec);