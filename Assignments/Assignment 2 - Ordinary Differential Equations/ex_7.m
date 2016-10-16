% This script is the program to simulate the oscillator using the leap-frog
% method.
% Alex Aalbertsberg (s1008129)
clc

k = 5; % spring constant given (5 N/m)
m = 2; % mass given (2 kg)

T = 60; %self-defined final simulation time

MaxStap = 600000; % maximum amount of steps
DeltaT = T/MaxStap; % calculate time step

%Pre-allocate arrays
x = zeros(1,MaxStap);
t = zeros(1,MaxStap);
e = zeros(1,MaxStap);

%initial values
x(1) = 1; w = 0; t(1) = 0; e(1) = 0;

%Time integration using leap-frog method
for i=1:MaxStap-1
    t(i+1) = t(i) + DeltaT; %update time
    
    a = -k*x(i)/m; % acceleration (a = F/m)
    w = w + a * DeltaT;
    x(i+1) = x(i) + w * DeltaT;
    
    e(i) = (1/2)*k*x(i)^2 + (1/2)*m*w^2;
end

plot(t,e); % plot energy as a function of time
xlabel('Time'); ylabel('Total Energy');