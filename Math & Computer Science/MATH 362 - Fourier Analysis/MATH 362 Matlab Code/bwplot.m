function bwplot = bwplot(A)

L = 255;
Map=[(0:L)/L;(0:L)/L;(0:L)/L]';
image(A), colormap(Map), axis image
