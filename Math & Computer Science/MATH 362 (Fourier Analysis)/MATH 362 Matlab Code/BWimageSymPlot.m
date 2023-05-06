function BWimageSymPlot = BWimageSymPlot(A);

L = 255;
Map=[(0:L)/L;(0:L)/L;(0:L)/L]';
[M,N] = size(A);
A1 = [A,A(:,N:-1:1)];
A2 = [A1;A1(M:-1:1,:)];    


figure

subplot(1,2,1), image(A),colormap(Map)

subplot(1,2,2), image(A2), colormap(Map)

%subplot(1,2,1), axis image, title('Original Image')

%subplot(1,2,2), axis image, title('Symmetrically Extended Image')


