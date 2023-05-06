function MatrixSymPlot = MatrixSymPlot(A)

%Check to see if A is a three-layer RGB color image.
%If it is color, then convert A to grayscale. 

B = A;

dimension = [size(A)];
if length(dimension) == 3
B = double(A);
B = 0.2989*B(:,:,1)+0.5870*B(:,:,2)+0.1140*B(:,:,3);
end   

[M,N] = size(B);
B1=[B,B(:,N:-1:1)];
B2=[B1;B1(M:-1:1,:)];

%The following commands set up the image plots.

L = 255;
Map=[(0:L)/L;(0:L)/L;(0:L)/L]';

figure

subplot(1,2,1), image(B),colormap(Map),
axis image, title('Original Black and White Image')

subplot(1,2,2), image(B2), colormap(Map),
axis image, title('Symmetric Extension of Image')

