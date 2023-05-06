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
L = length(x);
LdivN = (L/N) + 1;
    
%Zero-pad x front and back for use with IMDCT and TDAC.
zpad = zeros(N,1);
xz = [zpad;x;zpad];
Lz = length(xz);
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

%The inverse of C is C^T: 

CI = C';

%Compute the block vectors xb and the
%windowed block vectors xbw of xz, and 
%store them as columns of XB and XBW. 

XB = zeros(M,LdivN);
XBW = zeros(M,LdivN);

B = 1;

for k = 1:LdivN
    XB(:,k) =  xz(B:B+M-1);
    XBW(:,k) =  w(1:M).*xz(B:B+M-1);
    B = B + N;
end

XB = XB
XBW = XBW

%Perform MDCT on windowed block vectors xbw 
%by multiplying the matrix C into the matrix XB,
%and store results as columns of matrix CB. 

CB = C*XBW

%Compute the concatenated MDCT vector c,
%and then call the thresholding program.
%The thresholded concatenated vector is ct.

c = CB(:,1);

for k = 2:LdivN
   c = [c;CB(:,k)];
end
c_mag = abs(c);

threshold(c,r)
ct = z;
ct_mag = abs(ct);

%Unconcatenate ct to obtain thresholded block 
%vectors cbt, and store as columns of matrix CBT. 

CBT = zeros(N,LdivN);
B = 1;

for k = 1:LdivN
    CBT(:,k) =  ct(B:B+N-1);
    B = B + N;
end
 
CBT = CBT

%Use C^T to find the IMDCT block vectors yb by 
%multiplying the matrix C^T into the matrix CBT,
%and store results as columns of the matrix YB. 

YB = CI*CBT

%Window the block vectors yb to get resulting  
%vectors ybw, and store as columns of YBW.

YBW = zeros(M,LdivN);

for k = 1:LdivN
    YBW(1:M,k) =   w(1:M).*YB(1:M,k);
end
 
YBW = YBW

%Construct the thresholded xzt using the IMDCT and TDAC.
%The temporary column vector y is updated in the loop at
%each iteration in order to perform the TDAC steps. 

y(1:M,1) = zeros(M,1);
B = 0;

for k = 1:LdivN;
   xzt(B+1:B+N) = YBW(1:N,k)+y(N+1:M);
   y = YBW(1:M,k);
   B = B + N;
end

%The vector xt is extracted from the nonpadded
%middle part of xzt. 

xt = xzt(N+1:Lz-N)';

%For convenience of comparison, the original x is listed
%as the first column of Results_Matrix, and xt is listed
%as the second column. 

Results_Matrix_Below = ...
sprintf('The first column is x and the second column is xt.') 
Results_Matrix = [x,xt]


%Report the results and output from threshold program.

Percent_Reduction = ...
sprintf('The percent reduction is %f percent.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%The following commands are used to specify
%the plot window in the subsequent figure. 

h1 = min(min(x),min(xt));
h2 = max(max(x),max(xt));
h3 =  max(max(c_mag),max(ct_mag))+1;

if h1 >= 0 
    h1 = 0;
else 
    h1 = h1 - 1;
end

if h2 <= 0 
    h2 = 0;
else 
    h2 = h2 + 1;
end

%Now graph the original and compressed
%files side-by-side for comparison.

figure

subplot(2,2,1), stem(x_original),
title('Original Vector')
axis([0 L1+1 h1 h2])

subplot(2,2,2), stem(c_mag),
title('Original MDCT Magnitudes')
axis([0 Lz 0 h3])

subplot(2,2,3), stem(xt),
title('Thresholded Vector')
axis([0 L1+1 h1 h2])

subplot(2,2,4), stem(ct_mag),
title('Thresholded MDCT Magnitudes')
axis([0 Lz 0 h3])
