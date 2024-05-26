function MDCTinvMatrix = MDCTinvMatrix(x,N) 
    
%N is the block size and is an even number.
%First we make sure the input vector is vertical.

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x;
    
%Zero-pad x front and back for use with IMDCT and TDAC.
z = zeros(N,1);
x = [z;x;z];
L = length(x);
M = 2*N;

%This loop computes the MDCT and IMDCT transform matrices.
for i = 1:N
    for j = 1:M
        C(i,j) = cos(pi./N*(j-1/2+N/2)*(i-1/2));
    end
end
C = sqrt(1/N)*C
CI = C'
D = CI*C

%This loop computes the MDCT transform blocks.
for B = 0:N:L-M;
   c = C*x(B+1:B+M);
   cm(B+1:B+N) = c(1:N);
end


%This loop computes the blocks of x using the IMDCT and TDAC.
ym(1:M) = zeros(1,M);
for B = 0:N:L-M;
   y = CI*cm(B+1:B+N)'
   xm(B+1:B+N) = y(1:N)+ym(N+1:M)';
   xblock = xm'
   ym = y';
end

xm = xm(N+1:L-N)';

%Now list and graph the original and MDCT processed
%files side-by-side for comparison.
x_original = x_original
x_MDCT_matrix_processed = xm

subplot(1,2,1), stem(x_original),
title('Original Vector')

subplot(1,2,2), stem(xm),
title('MDCT Matrix Processed Vector')
