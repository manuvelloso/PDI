%% Ventanas e información de pixel
%% Dibujar imagen acotando niveles de gris
RGB = imread('Lena.png');

Aux=rgb2gray(RGB);

k1 = find(Aux<100);
Aux(k1)=0;

k2 = find(Aux>150);
Aux(k2)=255;

figure(1)
subplot(1,2,1)
imshow(Aux);
subplot(1,2,2)
imshow(rgb2gray(RGB));

%% Dibujar región de imagen contenida entre 100-220 (filas) y 150-200 (cols)
figure(2)
imshow(RGB(100:220, 150:200));

