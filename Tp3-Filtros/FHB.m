%% Filtro High Boost
function h = FHB(N,A)
kI = zeros(N); %matriz NxN llena de ceros
m = round(N/2);
kI(m,m) = 1;
h = (A-1)*kI + FPA(N);