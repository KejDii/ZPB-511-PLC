clear

N=20000; % liczba iteracji
K=10; % liczba powtórzeń benchmarka
ops_per_iter = 9;  % operacje na 1 iteracje -> 5 mul + 3 add + 1 div
operacje = ops_per_iter * N; %laczna liczba operacji

czasy=zeros(K,1);
flopsy=zeros(K,1);
wartosci_pi=zeros(K,1);
bledy=zeros(K,1);

fprintf('--- Nilakanthe Benchmark ---\n');

for k = 1:K
    t = tic;
    pi_nila=nilakanthe(N);
    czas=toc(t);

    FLOPS= operacje / czas;
    blad= abs(pi - pi_nila);

    czasy(k)= czas;
    flopsy(k)= FLOPS;
    wartosci_pi(k)= pi_nila;
    bledy(k)  = blad;

    fprintf('\nTest %2d:\n', k);
    fprintf('  PI:   %.30f\n', pi_nila);
    fprintf('  Czas: %.6f s\n', czas);
    fprintf('  FLOPS: %.3e\n', FLOPS);
    fprintf('  Blad: %.3e\n', blad);
end

fprintf('\n--- Podsumowanie (srednia z 10 testow) ---\n');
fprintf('Iteracje = %d, operacje/iter = %d, operacje = %d\n', N, ops_per_iter, operacje);

fprintf('Czas:  srednia = %.6f s, min = %.6f s, max = %.6f s\n', ...
    mean(czasy), min(czasy), max(czasy));

fprintf('FLOPS: srednia = %.3e, min = %.3e, max = %.3e\n', ...
    mean(flopsy), min(flopsy), max(flopsy));

fprintf('Blad:  srednia = %.3e', mean(bledy));
