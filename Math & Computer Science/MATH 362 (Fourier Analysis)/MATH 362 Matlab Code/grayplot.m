function grayplot = grayplot(A)

GrayA = 0.2989*double(A(:,:,1)) + 0.5870*double(A(:,:,2))+0.1140*double(A(:,:,3));
L = 255;
Map=[(0:L)/L;(0:L)/L;(0:L)/L]';
image(GrayA), colormap(Map), axis image
