function MDCTfftwinthresh = MDCTfftwinthresh(x,N,r) 
global z PR CR 

%For this program, r is the desired percent reduction
%N is the block size and is an even number.

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x;
    
%Zero-pad x front and back for use with IMDCT and TDAC.
zpad = zeros(N,1);
x = [zpad;x;zpad];
L = length(x);
M = 2*N;
m=[1:1:M]';
w = sqrt(2)*sin(pi./M*(m-0.5));

%This loop computes the MDCT transform blocks using the fft.
for B = 0:N:L-M;
   a = w(1:M).*x(B+1:B+M);
   b(1:N/2) = -a(3*N/2:-1:N+1) - a(3*N/2+1:2*N);
   b(N/2+1:N) = a(1:N/2) - a(N:-1:N/2+1);
   c(1:8*N)=zeros(1,8*N);
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = -b(N:-1:1);  
   c(4*N+2:2:6*N) = -b(1:N);
   c(6*N+2:2:8*N) = b(N:-1:1);
   cfft = fft(c');
   cmfft = (1/4)*sqrt(1/N)*real(cfft(2:2:2*N));
   cm(B+1:B+N) = cmfft(1:N);
end

%Here we call the thresholding program.
cm_original = cm';
threshold(cm,r)
cm = z;

%This loop computes blocks of x using the IMDCT, TDAC and fft.
ym(1:M) = zeros(M,1);
for B = 0:N:L-M;
   b = cm(B+1:B+N);
   c(1:8*N)=zeros(1,8*N); 
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = -b(N:-1:1);  
   c(4*N+2:2:6*N) = -b(1:N);
   c(6*N+2:2:8*N) = b(N:-1:1);
   cfft = fft(c');
   y = (1/4)*sqrt(1/N)*real(cfft(2+N:2:5*N));
   y = w(1:M).*y(1:M);
   xmw(B+1:B+N) = y(1:N)+ym(N+1:M)';
   ym = y';
end

xmw = xmw(N+1:L-N)';

%Report the results and output from threshold program:
x_original = x_original
x_thresholded = xmw
cm_original = cm_original
cm_windowed_thresholded = cm

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Now graph the original and compressed
%files side-by-side for comparison.

subplot(2,2,1), stem(x_original),
title('Original Vector')

subplot(2,2,2), stem(xmw),
title('Compressed Vector')

subplot(2,2,3), stem(abs(cm_original)),
title('Original MDCT Magnitudes')

subplot(2,2,4), stem(abs(cm)),
title('Thresholded MDCT FFT Magnitudes')

