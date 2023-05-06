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

%This loop computes the DCT II and IDCT II transform matrices.
for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1));
    end
end
C(1,:) = sqrt(1/2)*C(1,:);
C = sqrt(2/N)*C;
CI = inv(C);

%This loop computes the DCT II transform blocks.
L = length(x);
for B = 0:N:L-N;
   c2(B+1:B+N) = C*x(B+1:B+N);
end

%Here we call the thresholding program.
c2_original = c2';
threshold(c2,r)
c2 = z;

%This loop computes blocks of x using the IDCT II.
for B = 0:N:L-N;
   xm(B+1:B+N) = CI*c2(B+1:B+N);
end

xm = xm(1:L1);

%Report the results and output from threshold program:

x_original = x_original
x_thresholded = xm'
c2_original = c2_original
c2_thresholded = c2

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Now graph the original and compressed
%files side-by-side for comparison.

subplot(2,2,1), stem(x_original),
title('Original Vector')

subplot(2,2,2), stem(xm),
title('Compressed Vector')

subplot(2,2,3), stem(abs(c2_original)),
title('Original DCT II Magnitudes')

subplot(2,2,4), stem(abs(c2)),
title('Thresholded DCT II Magnitudes')