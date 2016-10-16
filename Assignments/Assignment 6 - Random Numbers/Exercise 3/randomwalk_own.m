clear all
clc

x = 0; %initial x0 = 0
dt = 1; %time step = 1
dx = 1; %distance step = 1

runs = 50;
timesteps = 2^20;

%preallocate matrices
xvec = zeros(timesteps+1,runs);
xvec(1,:) = 0;
y = zeros(timesteps+1,runs);

[vec, vec2] = rng_init(1,timesteps);

for i=1:1:runs
    %builtin rng
    vec = rand([timesteps 1]);
    
    %decide positive or negative step
    for t=1:1:timesteps
        if(vec2(t) <= 0.5)
           xvec(t+1,i) = xvec(t,i) + dx;
        elseif(vec2(t) > 0.5)
           xvec(t+1,i) = xvec(t,i) - dx;
        end
    end
end

% preallocate x and x square vector
x = zeros(timesteps+1,1);
x2 = zeros(timesteps+1,1);

%determine x and x squared
for i=1:1:timesteps+1
    total = 0;
    total2 = 0;
    for j=1:1:runs
        total = total + xvec(i,j);
        total2 = total2 + (xvec(i,j))^2;
    end
    
    x(i) = total/runs;
    x2(i) = total2/runs;
end

%plot results
figure
plot(x)

x_values = -200:1:200;
pd = fitdist(x, 'Normal')
y = pdf(pd,x_values);
figure
plot(x_values,y,'LineWidth',2)

figure
plot(x2)