function TDAC = TDAC(x,N) 

%This program generates the overlapped blocks xb of x, 
%then computes the MDCT of each xb, followed by the 
%IMDCT, then uses TDAC to reconstruct x. 

%N is the overlap size and is a preferably an even
%number that divides the length of x.  

%First we make sure the input vector x is vertical.

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   

L = length(x);

%%Compute the block length m.
m = 2*N;

%Zero-pad x front and back.
z = zeros(N,1);
xz = [z;x;z];
Lz = length(xz);

%Compute the number of block vectors of xz. 
LdivN = (L/N) + 1;

%Compute the block vectors of xz, and 
%store them as columns of matrix XB. 

XB = zeros(m,LdivN);
B = 1;

for k = 1:LdivN
    XB(:,k) = xz(B:B+m-1);
    B = B + N;
end
 
XB = XB

%Generate the MDCT matrix C. 

for i = 1:N
    for j = 1:m
        C(i,j) = cos(pi./N*(j-1/2+N/2)*(i-1/2));
    end
end

C = sqrt(1/N)*C;

%Perform the MDCT on the blocks vectors xb 
%by multiplying the matrix C into the matrix XB,
%and store results as columns of matrix CB. 

CB = C*XB

%The inverse of C is C^T: 
CI = C';

%Use C^T to find the IMDCT block vectors y by 
%multiplying the matrix C^T into the matrix CB,
%and store results as columns of the matrix YB. 

YB = CI*CB

%This loop reconstructs xz using the IMDCT and TDAC.
%The temporary column vector y is updated in the loop at
%each iteration in order to perform the TDAC steps. 

y(1:m,1) = zeros(m,1);
B = 0;

for k = 1:LdivN;
   xz_TDAC(B+1:B+N) = YB(1:N,k)+y(N+1:m);
   y = YB(1:m,k);
   B = B + N;
end

%The vector x_TDAC is extracted from the nonpadded
%middle part of the reconstructed xz_TDAC. 

x_TDAC = xz_TDAC(N+1:Lz-N)'

