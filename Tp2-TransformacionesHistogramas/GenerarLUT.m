%% Look Up Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Inputs: brillo (b) y contraste (c)
%   Output: LUT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function LUT = GenerarLUT(b,c, neg)
in=0:255;

if(neg == 1)
    LUT = 255 - in; % Ejemplo LUT negativo 
else
    LUT = c*in + b;  % Genero vector de la LUT
end
% Saturo los valores de la LUT
LUT(LUT>255) = 255;
LUT(LUT<0) = 0;

end