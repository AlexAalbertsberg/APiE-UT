%This function simulates a damped harmonic oscillator equipped with a
%driving force.

function dxdt = harmonic_oscillator_damped_driven(t, x)

k = 5; % spring constant
m = 2; % object mass
c = 0.1; % friction parameter

p = x(1); % position
v = x(2); % velocity

f = 0.1; %amplitude
omega = 1; % frequency

dxdt = [v; (-k * p - c * v + f * cos(omega*t))/m]; % both