%% FPA
function h = FPA(N) %N tiene que ser impar
kI = zeros(N); %matriz NxN llena de ceros
m = round(N/2);
kI(m,m) = 1;

FPB = fspecial('average', [N N]);
h = kI- FPB;