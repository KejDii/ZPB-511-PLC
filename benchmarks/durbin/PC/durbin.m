% Based on the durbin benchmark available as a part of 
% PolyBench/C 4.2.1 (beta) by Louis-Noel Pouchet and Tomofumi Yuki:
% https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1/tree/master/linear-algebra/solvers/durbin
% Copyright (c) 2011-2016 the Ohio State University.
% License: https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1/tree/master?tab=License-1-ov-file#readme
clear; close all; clc;

CPU = '?'; % name of the CPU (only for printing on the screen)
N = 120; % decremented length of vectors
M = 100000; % how many times to run benchmark
types = {'single','double'};

disp('======================================================');
fprintf('CPU: %s\n',CPU);
fprintf('Averaged results for N=%d over M=%d runs.\n',N,M);

for t = 1:1:length(types)
    type = types{t};
    % array initalization
    benchResults = zeros(1,M);
    rArray = cast((N+1):-1:1,type);
    yArray = cast(zeros(1,N+1),type);
    zArray = cast(zeros(1,N+1),type);
    alpha = cast(0,type);
    beta = cast(0,type);
    sigma = cast(0,type);
    disp('------------------------------------------------------');
    fprintf('Datatype: %s (%d-bit)\n',type,whos('sigma').bytes*8);
    
    % run benchmark M times
    for k=1:1:M
        % === benchmark start ===
        tic;
    
        yArray(1,1) = -rArray(1,1);
        beta = 1;
        alpha = -rArray(1,1);
        for i = 2:1:N
            beta = (1-alpha*alpha)*beta;
            sigma = 0;
            for j = 1:1:(i-1)
                sigma = sigma + rArray(1,i-j)*yArray(1,j);
            end
            alpha = -(rArray(1,i-1)+sigma)/beta;
            for j = 1:1:(i-1)
                zArray(1,j) = yArray(1,j)+alpha*yArray(1,i-j);
            end
            for j = 1:1:(i-1)
                yArray(1,j) = zArray(1,j);
            end
            yArray(1,i) = alpha;
        end
    
        elapsedTime = toc;
        benchResults(1,k) = elapsedTime;
        % === benchmark end ===
    end

    % calculate results
    avg = mean(benchResults);
    variance = var(benchResults); % variance from sample
    fprintf('avg. t = %0.4f [ms]\n',avg*10^3);
    fprintf('var. = %0.4f [(ms)^2]\n',variance*(10^3)^2);
end
disp('======================================================');
