function pixelboxgray = pixelboxgray(A,i,j)

%This function outlines pixel (i,j) on the original 
%black and white image A by graphing a black box on A.
%The new image is given by the matrix B. 

B = A;
m = 5;
n = 5;
B(i-2*m:i+2*m,j-2*n:j-n) = 0;  %Left vertical boundary of box 
B(i-2*m:i+2*m,j+n:j+2*n) = 0;  %Right vertical boundary of box
B(i-2*m:i-m,j-2*n:j+2*n) = 0;  %Top horizontal boundary of box
B(i+m:i+2*m,j-2*n:j+2*n) = 0;  %Bottom horizontal boundary of box

figure

MatrixPlot(B) 


