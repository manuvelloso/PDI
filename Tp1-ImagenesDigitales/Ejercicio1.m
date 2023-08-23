%% a
RGB = imread('Lena.png');
image(RGB)

%% b
RGB_INFO = imfinfo('Lena.png');
imshow('Lena.png')

%% c
%imwrite(RGB,'Lena.png','BitDepth',8);