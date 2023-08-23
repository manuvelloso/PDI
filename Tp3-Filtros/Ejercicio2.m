%% Filtros no linales
%% Filtro de mediana 
img = imread('test.bmp');

% Contaminar una imagen con ruido de tipo Salt & Pepper. 
% Variar el porcentaje de ruido entre 5% y 50% de a pasos de 5%.
%for i=5:5:50
 %   img_noise = imnoise(img, 'salt & pepper', i/100);
 %   figure(1)
 %   imshow(img_noise);
 %   title('Salt & Pepper');
 %   pause();
%end

% Aplicar algunos filtros convolucionales suavizantes a la imagen con
% ruido. ¿Qué resultado observa? ¿Se elimina correctamente el ruido?

A = 100;
PB1 = fspecial('average'); 
PB2 = fspecial('gaussian',[50 50]);
img_noise = imnoise(img, 'salt & pepper', 5/100);

img1 = filter2(PB1,img_noise);
img2 = filter2(PB2, img_noise);

% Aplicar filtrado mediano para eliminar el ruido
img3 = medfilt2(img_noise, [3, 3]); 

figure(2)
subplot(2,3,1)
imshow(img);
title('original');
subplot(2,3,2)
imshow(img_noise);
title('ruido');
subplot(2,3,3)
imshow(img1);
title('filtro media movil');
subplot(2,3,4)
imshow(img2);
title('filtro gaussiano');
subplot(2,3,5)
imshow(img3);
title('filtro mediana');

% Filtrar las imágenes con ruido obtenidas en el inciso i con el filtro de
% la mediana. 

% Vector para almacenar imágenes
k = 10; % Número de imágenes
img_noise = cell(1, k);
img_filter = cell(1, k);

% Generar imágenes con diferentes niveles de ruido
for i = 1:k
    ruido = i * 5; % Calcular el nivel de ruido en cada iteración
    img_noise{i} = imnoise(img, 'salt & pepper', ruido / 100);
end

% Filtrar imágenes 
for i = 1:k
    img_filter{i}= medfilt2(img_noise{i}, [3, 3]);
end

% Imágenes con ruido
figure (3);
for i = 1:k
    subplot(2, 10, i);
    imshow(img_noise{i});
    title(['Ruido: ', num2str(i * 5), '%']);
    subplot(2, 10, i+k);
    imshow(img_filter{i});
    title(['Ruido: ', num2str(i * 5), '%']);
end


%% Cruce por cero
% Utilizar la función edge para detectar los cruces por cero de un filtro
% LoG.
LoG = edge(img,'log');

%% Filtro de Canny
% Utilizar la función edge para filtrar una imagen con el filtro de
% Canny
C = edge(img,'canny');

figure(4);
subplot(1,3,1)
imshow(LoG);
title('filtro Log');
subplot(1,3,2)
imshow(C);
title('filtro Canny');
subplot(1,3,3)
imshowpair(LoG,C)

% Variar los umbrales inferior y superior y observar los resultados.
k = 5;
img_Canny = cell(1,k);

for i=1:k
    lower = (i - 1) / k;   % Umbral inferior
    upper = (i / k)- 0.05;         % Umbral superior
    img_Canny{i} = edge(img,'canny',[lower upper]);
    
    figure(5);
    subplot(1, k, i);
    imshow(img_Canny{i});
    title(['Canny: [', num2str(lower), ',', num2str(upper),']']);
end 

% Variar el valor de sigma del filtrado gaussiano y observar los
% resultados.
k = 5;
img_sigma = cell(1,k);

for i=1:k
    img_sigma{i} = edge(img, 'canny', [], i);
    
    figure(6);
    subplot(1, k, i);
    imshow(img_sigma{i});
    title(['Canny: sigma=', num2str(i)]);
end 

% Obtener los umbrales para el filtro a partir de percentilos del
% histograma de la magnitud del gradiente de la imagen. Por ejemplo:
% percentilos 10 y 90.

% Calcular el gradiente de la imagen
[dx, dy] = gradient(double(img));
grad = sqrt(dx.^2 + dy.^2);

% Calcular el histograma de la magnitud del gradiente
hist = imhist(uint8(grad));

% Calcular los percentiles
percentil_10 = prctile(hist, 10);
percentil_90 = prctile(hist, 90);

% Aplicar el filtro Canny con los umbrales calculados
img_iv = edge(img, 'canny', [percentil_10 / 255, percentil_90 / 255]);

% Mostrar la imagen original y la imagen con bordes detectados
figure(7)
imshowpair(img, img_iv, 'montage');
title('original || canny');


