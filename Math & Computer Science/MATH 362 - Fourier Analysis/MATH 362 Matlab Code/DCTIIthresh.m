function DCTIIthresh = DCTIIthresh(x,r) 
global z PR CR 

%For this program, r is the desired percent reduction
%We will perform the DCT II on blocks of length N = 8. 

N = 8;

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x

%We pad x so that its length is a multiple of N.

L1 = length(x);
LN = L1/N;
CLN = ceil(LN);
LNdiff = N*(CLN - LN);
LNpad = x(L1)*ones(LNdiff,1);
x = [x;LNpad];
x_pad = x

%This loop computes the DCT II transform blocks using the fft.
L = length(x);
for B = 0:N:L-N;
   b = x(B+1:B+N);
   c(1:4*N)=zeros(1,4*N);
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = b(N:-1:1);  
   c = fft(c');
   c = (1/2)*sqrt(1/N)*real(c(2:2:2*N));
   c(1) = c(1)/sqrt(2);
   cfft(B+1:B+N) = c;
end

%Here we call the thresholding program.
c_original = cfft';
threshold(cfft,r)
cfft = z;

%This loop computes blocks of x using the IDCT II via the fft.
for B = 0:N:L-N;
   b = cfft(B+1:B+N);
   c(1:4*N)=zeros(1,4*N);
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = b(N:-1:1);  
   c = fft(c');
   c = (1/2)*sqrt(1/N)*real(c(2:2:2*N));
   c(1) = c(1)/sqrt(2);
   xm(B+1:B+N) = c;
end

%Report the results and output from threshold program:

x_original = x_original
x_thresholded = xm'
x_diff = x_original - x_thresholded
c_original = c_original
c_thresholded = cfft

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Now graph the original and compressed
%files side-by-side for comparison.

figure
subplot(2,2,1), stem(x_original),
title('Original Vector')

subplot(2,2,2), stem(xm),
title('Compressed Vector')

subplot(2,2,3), stem(abs(c_original)),
title('Original DCT II Magnitudes')

subplot(2,2,4), stem(abs(cfft)),
title('Thresholded DCT II Magnitudes')