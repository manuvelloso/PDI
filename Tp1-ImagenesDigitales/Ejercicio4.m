%% Tipo de variable de matrices
% unit8 y su rango de los valores de la matriz son:
RGB = imread('Lena.png');

%max(RGB(:))
%min(RGB(:))

%% Convertir el tipo de dato de las matrices a double y dibujar resultado
%imwrite(RGB,'Lena_double.png','BitDepth',16);
RGB_2=im2double(RGB); %si no usaba esto lo tendría que haber dividido por 255
%RGB_2=imadjust(rgb2gray(RGB_2));

subplot(1,2,1)
imshow(RGB_2);
subplot(1,2,2)
imshow(RGB);