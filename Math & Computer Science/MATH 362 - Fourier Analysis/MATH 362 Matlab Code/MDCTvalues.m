function MDCT = MDCT(x,N) 

%This program generates the overlapped blocks xm of x, 
%then computes the MDCT cm of each xm. 

%N is the block size and is a preferably an even
%number that divides the length of x.  

%First we make sure the input vector is vertical.

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   

L = length(x);

%M is the block length
M = 2*N;

%Compute the number of block vectors of x. 
LdivN = (L/N) + 1;

%Zero-pad x front and back.
z = zeros(N,1);
xz = [z;x;z];
Lz = length(xz);

%Compute the block vectors of xz, and 
%store them as columns of matrix xm. 

xm = zeros(M,LdivN);
B = 1;

for k = 1:LdivN
    xm(:,k) = xz(B:B+M-1);
    B = B + N;
end
 
xm = xm

%Generate the N x M MDCT matrix C. 

cm = zeros(N,LdivN);

for i = 1:N
    for j = 1:M
        C(i,j) = cos(pi./N*(j-1/2+N/2)*(i-1/2));
    end
end

C = sqrt(1/N)*C;

%Perform the MDCT on the blocks vectors of x 
%by multiplying the matrix C into the matrix xm,
%and store results as columns of matrix cm. 

cm = C*xm


  
  

