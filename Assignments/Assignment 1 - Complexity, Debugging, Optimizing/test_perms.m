% Test for perms (values N 1..10)

% Pre-allocate vector for storing timer values.
time = zeros(10,1);

perms(1:1);

% calculate and store time it takes to complete the algorithm for each N.
for i = 1:10
    tic();
    perms(1:i);
    time(i) = toc();
end

% draw the graph
figure
loglog(1:10,time);

xlabel('N')
ylabel('time in seconds')
grid on