function IMDCTwinthresh = IMDCTwinthresh(x,N,r) 
global z PR CR

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x = x
    
%N is the block size and is an even number
%Zero-pad x front and back for use with IMDCT and TDAC
z = zeros(N,1);
x = [z;x;z];
L = length(x);
M = 2*N;
m=[1:1:M]';
n=[1:1:N]';
w = sqrt(2)*sin(pi./M*(m-0.5));

%This loop computes the MDCT of the windowed vector x
for B = 0:N:L-M;
   for k = 1:N 
       xw = w(m).*x(m+B);
       c(k)= sqrt(1/N)*sum(xw(m).*cos(pi./N*(m-1/2+N/2)*(k-1/2)));
   end 
   cm(B+1:B+N) = c(1:N);
end


%Here we call the thresholding program
cm1 = cm';
threshold(cm,r)
cm = z;

%This loop computes the windowed IMDCT of thresholded cm using TDAC
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

xmw = xmw(N+1:L-N)'
stem(abs(xmw))

%Report the results and output from threshold program:
cm_original = cm1
cm_thresholded = cm
Percent_Reduction = PR
Compression_Ratio = CR

