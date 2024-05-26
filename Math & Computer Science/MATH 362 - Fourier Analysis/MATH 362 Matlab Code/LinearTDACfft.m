function LinearTDACfft = LinearTDACfft(a,b,K,N) 

%This program generates the MDCT and the IMDCT via the 
%FFT on the appropriately modified input vector, then 
%uses TDAC to reconstruct f. 

%N is the overlap size and is a preferably an even
%number that divides the length of f.  

%K is the number of sample nodes. 
%Determine sample nodes. 
    
t = [0:1/K:(K-1)/K]';

%Enter the formula for the function.

f = a*t + b;

%Compute the number of block vectors of the zero-padded f. 
Lf = length(f);
LdivN = (Lf/N) + 1;
    
%Zero-pad f front and back for use with IMDCT and TDAC.
z = zeros(N,1);
x = [z;f;z];
L = length(x);
M = 2*N;

%This loop computes the MDCT block vectors using the fft.
%The block vectors are stored as columns in the matrix CB. 

CB = zeros(N,LdivN);
k = 1;

for B = 0:N:L-M;
   XB(1:M,k) = x(B+1:B+M);
   a = x(B+1:B+M);
   b(1:N/2) = -a(3*N/2:-1:N+1) - a(3*N/2+1:2*N);
   b(N/2+1:N) = a(1:N/2) - a(N:-1:N/2+1);
   c(1:8*N)=zeros(1,8*N);
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = -b(N:-1:1);  
   c(4*N+2:2:6*N) = -b(1:N);
   c(6*N+2:2:8*N) = b(N:-1:1);
   XTB(1:8*N,k) = c(1:8*N);
   cfft = fft(c');
   cmfft = (1/4)*sqrt(1/N)*real(cfft(2:2:2*N));
   cm(B+1:B+N) = cmfft;
   CB(1:N,k) = cm(B+1:B+N);
   k = k+1;
end

XB = XB
XTB = XTB
CB = CB

%This loop computes blocks of f using the IMDCT, TDAC and fft.

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
f_TDAC_fft = xm(N+1:L-N)';

%For convenience of comparison, the original f is listed
%as the first column of Results_Matrix, and f_TDAC_fft is
%listed as the second column. 

Results_Matrix_Below = ...
sprintf('The first column is f and the second column is f_TDAC_fft.') 
Results_Matrix = [f,f_TDAC_fft]

figure

left = -0.1;
right = 1.1;
height1 = min(0.8*min(f),1.2*min(f));
height2 = 1.2*max(f);
sr = 8;

subplot(1,2,1), timestemplot(f,1,Lf,sr), 
axis([left right height1 height2])
xlabel('Time (sec)'), title('Plot of Original Vector')

subplot(1,2,2), timestemplot(f_TDAC_fft,1,Lf,sr), 
axis([left right height1 height2])
xlabel('Time (sec)'), title('Plot of TDAC FFT Vector')


