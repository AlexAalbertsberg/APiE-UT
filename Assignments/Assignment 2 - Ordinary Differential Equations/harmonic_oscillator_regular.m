%This function simulates a harmonic oscillator.

function dxdt = harmonic_oscillator_regular(t, x)

k = 5; % spring constant
m = 2; % object mass

p = x(1); % position
v = x(2); % velocity

dxdt =  [v; (-k * p)/m]; % without friction & driving force