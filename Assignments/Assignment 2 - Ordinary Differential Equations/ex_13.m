% This script is the program to perform the ode45 function in order to
% simulate a damped harmonic oscillator.
% This script plots the energy as a function of time.
% Alex Aalbertsberg (s1008129)

t0 = 0; %start time
tf = 60; %end time
x0 = 1; % initial posiiton of the spring-mass system
v0 = 0; % initial velocity of the spring-mass system

%Using ode45
odefun = @harmonic_oscillator_damped; % assign function handle
tspan = [t0, tf]; % time span
y0 = [x0; v0]; % initial position and velocity in a vector
[t,w] = ode45(odefun,tspan,y0); % call ode45 (RK)

x = w(:,1); %extract displacement vector
v = w(:,2); %extract velocity vector

e = zeros(1,length(x));
k = 5; %spring constant
m = 2; %mass
for i = 1:length(t)
    e(i) = (1/2)*m*v(i)^2 + (1/2)*k*x(i)^2;
end

%plot the results
plot(t,e);
xlabel('Time'); ylabel('Total Energy');