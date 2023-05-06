function MDCTMatrixwinthresh = MDCTMatrixwinthresh(x,N,r) 
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

%This loop computes the MDCT and IMDCT transform matrices.
for i = 1:N
    for j = 1:M
        C(i,j) = cos(pi./N*(j-1/2+N/2)*(i-1/2));
    end
end
C = sqrt(1/N)*C;
CI = C';

%This loop computes the MDCT transform blocks.
for B = 0:N:L-M;
   xw = w(1:M).*x(B+1:B+M);
   c = C*xw;
   cm(B+1:B+N) = c(1:N);
end

%Here we call the thresholding program.
cm_original = cm';
threshold(cm,r)
cm = z;

%This loop computes the blocks of x using the IMDCT and TDAC.
ym(1:M) = zeros(1,M);
for B = 0:N:L-M;
   y = CI*cm(B+1:B+N);
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
title('Thresholded MDCT Magnitudes')

