function matrix_product_complexity()

    % Create row vector with values 0 to 10000 (the 21 makes the step equal
    % to 500).
    n = linspace(0,10000,21);
    % Pre-allocate time vector.
    t = zeros(1,21);
    
    % start at n=1 because log(x) = 0 does not exist!
    n(1) = 1;
    ix = 1;
    
    % for all values n in vecsize
    for i = n
        % generate random n-by-n matrices
        M = rand(i);
        N = rand(i);

        % start timer
        %tic();
        time = cputime;
        % do the multiplication
        M*N;
        % stop timer and save elapsed time to the vector.
        t(ix) = cputime - time;
        ix = ix + 1;
    end

    figure
    % plot t as function of n
    loglog(n,t);
    
    % set logarithm axis values that make sense
    axis([1 10000 0.0001 100])
    
    % set axis labels
    xlabel('N')
    ylabel('time')
    
    grid on
end

