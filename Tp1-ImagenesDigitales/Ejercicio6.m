info = dicominfo('Corte.dcm');
image = dicomread(info);
imshow(image,[]); %si le saco los corchetes no se ve casi nada

% imcontrast(image); %no me funcó