%% Resolución espacial
% Reducir la resolución de la imagen en factores 1/4, 1/8, 1/16, 1/32
% y dibujarlas junto con la original

RGB = imread('Lena.png');
RGB_4 = imresize(RGB, 1/4);
RGB_8 = imresize(RGB, 1/8);
RGB_16 = imresize(RGB, 1/16);
RGB_32 = imresize(RGB, 1/32);
RGB_ori = imresize(RGB_32, 32);

subplot(2,3,1)
imshow(RGB);
subplot(2,3,2)
imshow(RGB_4);
subplot(2,3,3)
imshow(RGB_8);
subplot(2,3,4)
imshow(RGB_16);
subplot(2,3,5)
imshow(RGB_32);

subplot(2,3,6)
imshow(RGB_ori); %La info no se recupera! -se ve todo blury