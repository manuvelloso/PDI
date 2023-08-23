%% Look Up Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Inputs: imagen en gray, LUT de 256 elementos
%   Output: imagen con lut aplicada
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function img_lut = AplicarLUT(img, LUT)
img_lut = uint8(LUT(img+1));