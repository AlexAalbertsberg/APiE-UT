%This function simulates a damped harmonic oscillator.

function dxdt = harmonic_oscillator_damped(t, x)

k = 5; % spring constant
m = 2; % object mass
c = 0.1; % friction parameter

p = x(1); % position
v = x(2); % velocity

dxdt = [v; (-k * p - c * v)/m ]; % with friction, no driving force