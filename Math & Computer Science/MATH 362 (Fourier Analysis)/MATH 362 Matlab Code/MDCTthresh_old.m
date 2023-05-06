function MDCTthresh = MDCTthresh(x,N,r) 
global z PR CR 

%For this program, r is the desired percent reduction
%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x;

%We pad x so that its length is a multiple of M = 2N.
%If already the case, then loop will not change x.
M = 2*N;
L1 = length(x);
LM = L1/M;
CLM = ceil(LM);
LMdiff = M*(CLM - LM);
LMpad = x(L1)*ones(LMdiff,1);
x = [x;LMpad];
    
%Zero-pad x front and back for use with IMDCT and TDAC.
zpad = zeros(N,1);
x = [zpad;x;zpad];
L = length(x);
M = 2*N;
m=[1:1:M]';
w = sqrt(2)*sin(pi./M*(m-0.5));

x_original = x_original
x_zeropad = x

%This loop computes the MDCT and IMDCT transform matrices.
for i = 1:N
    for j = 1:M
        C(i,j) = cos(pi./N*(j-1/2+N/2)*(i-1/2));
    end
end
C = sqrt(1/N)*C;
CI = C';

%This loop computes the MDCT transform blocks.
k = 0;
for B = 0:N:L-M;
   k = k+1
   xk = x(B+1:B+M)
   xw = w(1:M).*xk(1:M);
   xkw = xw
   c = C*xw;
   cm(B+1:B+N) = c(1:N);
   ck = c
   ck_mag = abs(ck)
end

Next_Step = ...
sprintf('Thresholding (results at end), IMDCT, Windowing, TDAC')

%Here we call the thresholding program.
cm_original = cm';
threshold(cm,r)
cm = z;

%This loop computes the blocks of x using the IMDCT and TDAC.
ym(1:M) = zeros(1,M);
k = 0;
for B = 0:N:L-M;
   k = k+1
   y = CI*cm(B+1:B+N)
   y = w(1:M).*y(1:M);
   yw = y
   xmw(B+1:B+N) = y(1:N)+ym(N+1:M)';
   x_block = xmw(B+1:B+N)'
   ym = y';
end

xmw = xmw(N+1:L-N)';

%Report the results and output from threshold program.

Summary = ...
sprintf('Results are listed below.')

x = x_original
x_thresholded = xmw
c = cm_original
c_thresholded = cm


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
