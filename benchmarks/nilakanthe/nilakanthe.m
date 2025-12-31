function wynik = nilakanthe(N)
    %N-liczba iteracji
    wynik=3.0;%obliczanie pi zaczyna sie od 3

    for i=1:N
        wyraz = 4.0/((2*i)*(2*i+1)*(2*i+2));
        if mod(i,2) == 1
            wynik = wynik + wyraz;
        else
            wynik = wynik - wyraz;
        end
    end
end