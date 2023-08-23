%% Histogramas
img = imread('Lena.png');
R = img;
R(:,:,2)=0;
R(:,:,3)=0; %%me quedo con el rojo

G = img;
G(:,:,1)=0;
G(:,:,3)=0; %%me quedo con el verde

B = img;
B(:,:,1)=0;
B(:,:,2)=0; %%me quedo con el azul

%% a
figure(1)
subplot(3,2,1)
imhist(img(:,:,1));
grid;
subplot(3,2,2)
imshow(img(:,:,1));

subplot(3,2,3)
imhist(img(:,:,2));
grid;
subplot(3,2,4)
imshow(img(:,:,2));

subplot(3,2,5)
imhist(img(:,:,3));
grid;
subplot(3,2,6)
imshow(img(:,:,3));

%% b
figure(2)
subplot(3,2,1)
imhist(R(:,:,1));
grid;
subplot(3,2,2)
imshow(R);

subplot(3,2,3)
imhist(G(:,:,2));
grid;
subplot(3,2,4)
imshow(G);

subplot(3,2,5)
imhist(B(:,:,3));
grid;
subplot(3,2,6)
imshow(B);

%% d
% i
figure(3)
green = histogram(G(:,:,2),256, 'Normalization', 'probability');
% La probabilidad se ve en el gráfico
green.BinWidth=1;
probability_green = green.Values(138)

% ii
figure(4)
red = histogram(R(:,:,1), 256, 'Normalization', 'probability');
probability_red = sum(red.Values(20:181))

% iii PENSAR
