function MDCTwinthresh = MDCTwinthresh(x,N,r) 
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
n=[1:1:N]';
w = sqrt(2)*sin(pi./M*(m-0.5));

%This loop computes the MDCT of the windowed vector x.
for B = 0:N:L-M;
   for k = 1:N 
       xw = w(m).*x(m+B);
       c(k)= sqrt(1/N)*sum(xw(m).*cos(pi./N*(m-1/2+N/2)*(k-1/2)));
   end 
   cm(B+1:B+N) = c(1:N);
end


%Here we call the thresholding program.
cm_original = cm';
threshold(cm,r)
cm = z;

%This loop computes the windowed IMDCT of thresholded cm using TDAC.
ym = zeros(M,1);
for B = 0:N:L-M;
   for k = 1:M 
       y(k)=sqrt(1/N)*sum(cm(n+B).*cos(pi./N*(k-1/2+N/2)*(n-1/2)));
   end
   y = y';
   y = w(m).*y(m);
   xmw(B+1:B+N) = y(1:N)+ym(N+1:M);
   ym = y;
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