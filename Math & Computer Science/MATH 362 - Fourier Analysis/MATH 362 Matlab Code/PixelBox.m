function pixelbox = pixelbox(A,i,j)

%This function outlines pixel (i,j) on the original 
%color image A by graphing a black box on A.
%The new image is given by the matrix B. 


B = A;
m = 4;
n = 4;
B(i-2*m:i+2*m,j-2*n:j-n,1) = 0;
B(i-2*m:i+2*m,j+n:j+2*n,1) = 0;
B(i-2*m:i-m,j-2*n:j+2*n,1) = 0;
B(i+m:i+2*m,j-2*n:j+2*n,1) = 0;
B(i-2*m:i+2*m,j-2*n:j-n,2) = 0;
B(i-2*m:i+2*m,j+n:j+2*n,2) = 0;
B(i-2*m:i-m,j-2*n:j+2*n,2) = 0;
B(i+m:i+2*m,j-2*n:j+2*n,2) = 0;
B(i-2*m:i+2*m,j-2*n:j-n,3) = 0;
B(i-2*m:i+2*m,j+n:j+2*n,3) = 0;
B(i-2*m:i-m,j-2*n:j+2*n,3) = 0;
B(i+m:i+2*m,j-2*n:j+2*n,3) = 0;


figure

image(B)



