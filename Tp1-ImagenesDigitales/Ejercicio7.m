%% Ejercicio 7
%LUC debe tener el mismo rango de valores que la matriz de la img de entrada 
%B=LUT(A); voy a la pos (1,1) de A y se fija cuanto vale. Va al indice
%correspondiente y en la pos (1,1) de B pone lo que corresponde
%La imagen de entrada es el indice del vector, es el lugar donde tengo que
%ir a buscar en la tabla.
%Me tengo que desplazar uno a la derecha LUT(A+1)
%LUT entre 0 y 2333

%leo el DICOM
info = dicominfo('Corte.dcm');
image = dicomread(info);

%a) valores max y min
maximo = max(image(:));
minimo = min(image(:));

%b) crear LUT lineal
in = 0:(maximo-minimo+1);
c = 1;          %contraste
b = 10;         %brillo
%m = 255/(maximo-minimo+1);
%b = 255 - m*maximo;

LUT = c*in + b; %calculo de LUT

% Saturo los valores de la LUT
LUT(LUT>maximo) = 255;
LUT(LUT<0) = 0;

%muestro la imagen
img = uint8(LUT(image+1));

figure(1)
subplot(1,2,1)
imshow(image,[]);
Hfigure = imcontrast(1);

subplot(1,2,2);
imshow(img, 'DisplayRange',[]);
Hfigure = imcontrast(1);

% d) centro y ancho
center = 40;
width = 80;

m = 255/(2*width);
o = center + width - m*255;

LUT1 = m*in + o;
LUT1(LUT1>maximo) = 255;
LUT1(LUT1<0) = 0;

figure(2)
img1 = uint8(LUT(image+1));
imshow(img1);

% e) slice & crop
a = 130;
d = 200;
LUT_slice = slice(a,d,c,b,maximo);
LUT_crop = crop(a,d,c,b,maximo);

img2 = uint8(LUT_slice(image+1));
img3 = uint8(LUT_crop(image+1));

figure(3)
subplot(1,2,1)
imshow(img2)
title('slice');
subplot(1,2,2)
imshow(img3)
title('crop');

% f) Binarización de imagen
u=150;
LUT2 = binario(u);
img4 = uint8(LUT2(image+1));

figure(4)
subplot(1,2,1)
imshow(image,[]);
title('original');
subplot(1,2,2)
imshow(img4);
title('bn');