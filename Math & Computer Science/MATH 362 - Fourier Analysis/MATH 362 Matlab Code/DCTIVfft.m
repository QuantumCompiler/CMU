function DCTIVfft = DCTIVfft(x) 

%This program computes the DCT IV of x via the FFT. 
   
N = length(x); 
  
%The zero-padded even-odd extension y of x
%is generated here. 

y(1:8*N)=zeros(1,8*N); 
  
y(2:2:2*N) = x(1:N);
y(2*N+2:2:4*N) = -x(N:-1:1);  
y(4*N+2:2:6*N) = -x(1:N);
y(6*N+2:2:8*N) = x(N:-1:1);

%Compute the fft of y, then convert this
%to the c4 vector. 
  
z = fft(y');
c4fft = (1/4)*sqrt(2/N)*real(z(2:2:2*N))

%Plot the DCT IV Magnitudes. 

right = N+1;
height = 1.2*max(abs(c4fft));

stem(abs(c4fft)), title('DCT IV Magnitudes')
axis([0 right 0 height])
  