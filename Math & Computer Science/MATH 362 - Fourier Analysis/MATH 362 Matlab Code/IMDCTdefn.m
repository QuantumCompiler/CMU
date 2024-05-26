function IMDCT = IMDCT(x,N) 

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

%This loop computes the MDCT transform vector cm of x
for B = 0:N:L-M;
   for k = 1:N 
       c(k)= sqrt(1/N)*sum(x(m+B).*cos(pi./N*(m-1/2+N/2)*(k-1/2)));
   end 
   cm(B+1:B+N) = c(1:N);
end

%This loop computes the inverse blocks of x using the IMDCT and TDAC
ym(1:M) = zeros(1,M);
for B = 0:N:L-M;
   for k = 1:M 
       y(k)=sqrt(1/N)*sum(cm(n+B).*cos(pi./N*(k-1/2+N/2)*(n-1/2)));
   end
   xm(B+1:B+N) = y(1:N)+ym(N+1:M);
   ym = y;
end

xm = xm(N+1:L-N)'
stem(abs(xm))