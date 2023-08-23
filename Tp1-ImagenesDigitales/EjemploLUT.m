% Abro la imagen lena.png y guardo la matriz (o las matrices) de datos en A
img = imread('Lena.png');
% img tiene dimensión: N*M*3

% Convertir a la imagen a escala de grises
img_gs = rgb2gray(img);
% img_sg tiene dimensión: N*M

% Creo el vector de posibles intensidades (entrada)
in = 0:255;

% Defino contraste y brillo
c = 1;
b = -10;

% Calculo todas las posibles salidas y las almaceno en LUT
% out = c*in + b
LUT = c*in + b;  % Genero vector de la LUT
%LUT = 255 - in; % Ejemplo LUT negativo

% Saturo los valores de la LUT
LUT(LUT>255) = 255;
LUT(LUT<0) = 0;

img_gs_bc = uint8(LUT(img_gs));
% img_sg_bc tiene dimensión: N*M

% % Si estuviésemos en C:
%for i=1:size(img_gs,1)
%	for j=1:size(img_gs,2)
%		img_gs_bc(i,j) = LUT(img_gs(i,j) + 1);
%	end
%end

imshow(img_gs_bc);