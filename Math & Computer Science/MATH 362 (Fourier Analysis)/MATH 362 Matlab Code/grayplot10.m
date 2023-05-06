function grayplot10 = grayplot10(A)

L = 10;
Map=[(0:L)/L;(0:L)/L;(0:L)/L]';
image(A), colormap(Map), axis image
