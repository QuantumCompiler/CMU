function DCTIIfft = DCTIIfft(x) 
   
%This program computes the DCT II of x via the FFT. 
   
N = length(x); 
  
%The zero-padded even extension y of x
%is generated here. 

y(1:4*N)=zeros(1,4*N); 

y(2:2:2*N) = x(1:N);
y(2*N+2:2:4*N) = x(N:-1:1);  

%Compute the fft of y, then convert this
%to the c2 vector. 
  
z = fft(y');
c = 0.5*sqrt(2/N)*real(z(1:N));
c(1) = c(1)/sqrt(2);

c2fft = c

%Plot the DCT II Magnitudes. 

right = N+1;
height = 1.2*max(abs(c2fft));

stem(abs(c2fft)), title('DCT II Magnitudes')
axis([0 right 0 height])

