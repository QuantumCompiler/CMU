function MDCTfft = MDCTfft(x,N) 

%N is the block size and should be an even number.
%First we make sure the input vector is vertical.
    
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x;

%Compute the number of block vectors of the zero-padded x. 
Lx = length(x);
LdivN = (Lx/N) + 1;
    
%Zero-pad x front and back for use with IMDCT and TDAC.
z = zeros(N,1);
x = [z;x;z];
L = length(x);
M = 2*N;

%This loop computes the MDCT block vectors using the fft.
%The block vectors are stored as columns in the matrix CB. 

CB = zeros(N,LdivN);
k = 1;

for B = 0:N:L-M;
   a = x(B+1:B+M);
   b(1:N/2) = -a(3*N/2:-1:N+1) - a(3*N/2+1:2*N);
   b(N/2+1:N) = a(1:N/2) - a(N:-1:N/2+1);
   c(1:8*N)=zeros(1,8*N);
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = -b(N:-1:1);  
   c(4*N+2:2:6*N) = -b(1:N);
   c(6*N+2:2:8*N) = b(N:-1:1);
   cfft = fft(c');
   cmfft = (1/4)*sqrt(1/N)*real(cfft(2:2:2*N));
   cm(B+1:B+N) = cmfft;
   CB(1:N,k) = cm(B+1:B+N);
   k = k+1;
end

CB = CB

%This loop computes blocks of x using the IMDCT, TDAC and fft.

ym(1:M) = zeros(M,1);
YB = zeros(M,LdivN);
k = 1;

for B = 0:N:L-M;
   b = cm(B+1:B+N);
   c(1:8*N)=zeros(1,8*N); 
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = -b(N:-1:1);  
   c(4*N+2:2:6*N) = -b(1:N);
   c(6*N+2:2:8*N) = b(N:-1:1);
   cfft = fft(c');
   y = (1/4)*sqrt(1/N)*real(cfft(2+N:2:5*N));
   xm(B+1:B+N) = y(1:N)+ym(N+1:M)';
   xblock = xm';
   ym = y';
   YB(1:M,k) = ym;
   k = k+1;
end

YB = YB
x_TDAC_fft = xm(N+1:L-N)';

%For convenience of comparison, the original x is listed
%as the first column of Results_Matrix, and x_TDAC_fft is
%is listed as the second column. 

Results_Matrix_Below = ...
sprintf('The first column is x and the second column is x_TDAC_fft.') 
Results_Matrix = [x_original,x_TDAC_fft]



