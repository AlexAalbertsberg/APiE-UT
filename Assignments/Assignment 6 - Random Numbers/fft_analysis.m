clear all
clc

[vec,vec2] = rng_init(10,1024);

%perform fourier transform
x = fft(vec);

plot(x);
axis([-2000000 2000000 -2000000 2000000]);