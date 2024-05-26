function IMDCTwinThreshLong = IMDCTwinThreshLong(x,N,r) 
global z r

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
%Note that we want to threshold R% of the nonzero values
Lc = length(cm);
xnz = [nonzeros(x)];
Lx = length(xnz);
R = round(r/100*Lx);
P = Lx-Lx+R+1;

%The next command sorts the vector abs(cm) in ascending order
[a,j] = sort(abs(cm));

%These commands create an R% thresholded sorted abs(cm) 
zc = zeros(Lc-Lx,1);
zr = zeros(R,1);
ap = y(P:N);
ta = [zx;zr;ap];

%This loop reverses the sort
%The resulting vector z is the R% thresholded abs(cm)
for n = 1:Lc
    z(j(n)) = ta(n);
end

%The next line calculates the sign of the entries of cm. 
s = cm./(abs(cm)+(cm==0));

%We match the sign of z with the entries of cm
%Thus z will now be the R% thresholded cm. 
z = z'.*s;

%Report the results and output:
Percent_Reduction = R/M*100
Compression_Ratio = [M;M-R]
cm = cm
z = z
cm = z;

%This loop computes the windowed IMDCT of cm using TDAC
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