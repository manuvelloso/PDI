%% EJERCICIO 3
%% b) LUTs
img = imread('Lena.png');
img = rgb2gray(img);

b1=10;
b2=-20;

c1=1.7;
c2=0.3;

LUT1 = GenerarLUT(b1,c1,0);
LUT2 = GenerarLUT(b2,c2,0);
LUT3 = GenerarLUT(b1,c2,0);
LUT4 = GenerarLUT(b2,c1,0);

img1 = AplicarLUT(img, LUT1);
img2 = AplicarLUT(img, LUT2);
img3 = AplicarLUT(img, LUT3);
img4 = AplicarLUT(img, LUT4);

figure(1)
subplot(4,2,1)
imshow(img1);
subplot(4,2,2)
imhist(img1);

subplot(4,2,3)
imshow(img2);
subplot(4,2,4)
imhist(img2);

subplot(4,2,5)
imshow(img3);
subplot(4,2,6)
imhist(img3);

subplot(4,2,7)
imshow(img4);
subplot(4,2,8)
imhist(img4);

%% c) NEGATIVO
LUT_neg = GenerarLUT(b1,c1, 1);
img_neg = AplicarLUT(img, LUT_neg);
img_comp = imcomplement(img); 

figure(2)
subplot(1,3,1)
imshow(img);
title('Imagen Original');

subplot(1,3,2)
imshow(img_comp);
title('Imagen Complemento');

subplot(1,3,3)
imshow(img_neg);
title('Imagen Negativa');

%% d) CONTRAST STRETCHING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ME QUEDÓ INCOMPLETO EL INCISO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=76;
b=186;

figure(3)
h = histogram(img,256);

LUT = ContrastStreching(a,b,h);
img_CS = AplicarLUT(img, LUT);

subplot(1,3,1)
imshow(img);
title('imagen original');
subplot(1,3,2)
imshow(img_CS);
title('contrast streching');

img_ad = imadjust(img); %NO ENTIENDO COMO FUNCIONA ESTO!!
subplot(1,3,3)
imshow(img_ad);
title('imagen ajustada');

figure(4)
subplot(1,2,1)
plot(img,img_CS,'.'); %para plotear la función transferencia
title('T(r) Contrast Streching');
grid;

subplot(1,2,2)
plot(img,img_ad, '.');
title('T(r) Adjust');
grid;

%% e) Histograma acumulado
[counts, edges] = histcounts(img, 'Normalization', 'cumcount');

figure(5)
subplot(1,2,1)
bar(edges, [0, counts], 'LineWidth', 1);
xlabel('Valores');
ylabel('Frecuencia acumulada');
title('Histograma Acumulado');

subplot(1,2,2)
imhist(img);
title('Histograma');
hold on
plot((0:255),(0:255));
hold off

%% f) Umbralización
% ISODATA
u_iso = ISODATA(img);
LUT_bin_iso = binario(round(u_iso));
img_iso = AplicarLUT(img,LUT_bin_iso);

% OTSU ESTE NO ME SALIO!!
u_otsu = OTSU(img);
LUT_bin_ots = binario(round(u_otsu));
img_otsu = AplicarLUT(img,LUT_bin_ots);

% TRIÁNGULO (debería ser 'a mano'?)

figure(6)
subplot(1,3,1)
imshow(img_iso);
title('ISODATA');
subplot(1,3,2)
imshow(img_otsu);
title('OTSU');
subplot(1,3,3)
imshow(img);
title('original');

% v
LUT_X = binario(100);
img_X = AplicarLUT(img,LUT_X);
LUT_mas = binario(150);
img_mas = AplicarLUT(img,LUT_mas);

figure(7)
subplot(1,3,1)
imshow(img);
title('original');
subplot(1,3,2)
imshow(img_X);
title('X');
subplot(1,3,3)
imshow(img_mas);
title('+');
% NO SE SI HICE LO QUE PEDÍA


