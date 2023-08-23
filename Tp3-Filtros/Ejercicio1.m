%% Filtros convolucionales

img = imread('test.bmp');

hi = fspecial('average');
hii = fspecial('gaussian',[3 3],90);
hiii = fspecial('laplacian',0.7);
hiv = fspecial('log');
hv = fspecial('prewitt');
hvi = fspecial('sobel');

img1 = filter2(hi, img);
img2 = filter2(hii,img);
img3 = filter2(hiii, img);
img4 = filter2(hiv, img);
img5 = filter2(hv, img);
img6 = filter2(hvi, img);

figure(1)
subplot(2,4,1)
imshow(img);
title('original');
subplot(2,4,2)
imshow(img1);
title('media movil');
subplot(2,4,3)
imshow(img2);
title('gaussiano');
subplot(2,4,4)
imshow(img3);
title('laplaciano');
subplot(2,4,5)
imshow(img4);
title('LoG');
subplot(2,4,6)
imshow(img5);
title('prewitt');
subplot(2,4,7)
imshow(img6);
title('sobel');

%% Filtro Pasa Altos
PA = FPA(3);
img_FPA = filter2(PA,img);
figure(2)
subplot(1,2,1)
imshow(img);
title('original');
subplot(1,2,2)
imshow(img_FPA);
title('FPA');

%% Filtro FB
A = 10;
HB = FHB(3,A);
img_HB = filter2(HB,img);

figure(3)
subplot(1,2,1)
imshow(img);
title('original');
subplot(1,2,2)
imshow(img_HB);
title('High Boost');

