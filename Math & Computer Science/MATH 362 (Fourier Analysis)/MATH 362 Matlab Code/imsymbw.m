function imsymbw = imsymbw(A)

Abw = 0.2989*double(A(:,:,1)) + 0.5870*double(A(:,:,2))+0.1140*double(A(:,:,3));
L = 255;
Map=[(0:L)/L;(0:L)/L;(0:L)/L]';
[M,N] = size(Abw);
A1=[Abw,Abw(:,N:-1:1)];
A2=[A1;A1(M:-1:1,:)];
imagesc(A2), colormap(Map),axis image,
title('Symmetrically Extended Image')
