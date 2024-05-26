function color2gray = color2gray(A)

%We first convert the jpeg image A from 
%default unit8 data to double precision data. 
%The unit8 data format is a more efficient 
%formating for Matlab than double precision.
%The double precision data format is needed 
%to perform mathematical operations. 

d = double(A)/255;

%After this conversion, we separate the 
%red, green and blue components of the image. 

r = d(:,:,1);
g = d(:,:,2);
b = d(:,:,3);

%We next convert the original image A into a 
%grayscale image B using standardized
%conversion coefficients.

B = 0.2990*r + 0.5870*g + 0.1140*b;

%The next command writes the grayscale matrix
%to a correpsonding black and white jpeg image. 
%This image will be written to the current work folder. 

imwrite(B,'color2graypic.jpg')

%Next, we load the grayscale image G and 
%then plot G and the original color image A. 

G =  imread('color2graypic.jpg');

figure
MatrixPlot(G), axis image, title('Grayscale Image')

figure
image(A), axis image, title('Color Image')


