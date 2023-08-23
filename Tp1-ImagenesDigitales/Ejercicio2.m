%% Transformar a escala de grises
RGB = imread('Lena.png');
GRAY = rgb2gray(RGB);
imshow(GRAY);

R = RGB;
R(:,:,2)=0;
R(:,:,3)=0; %%me quedo con el rojo

G = RGB;
G(:,:,1)=0;
G(:,:,3)=0; %%me quedo con el verde

B = RGB;
B(:,:,1)=0;
B(:,:,2)=0; %%me quedo con el azul

%% Mostrar por separado
subplot(2,3,1)
imshow(RGB(:,:,1));

subplot(2,3,2)
imshow(RGB(:,:,2));

subplot(2,3,3)
imshow(RGB(:,:,3));

subplot(2,3,4)
imshow(R);

subplot(2,3,5)
imshow(G);

subplot(2,3,6)
imshow(B);


