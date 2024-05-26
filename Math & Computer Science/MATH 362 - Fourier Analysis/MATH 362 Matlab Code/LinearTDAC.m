function LinearTDAC = LinearTDAC(a,b,K,N) 

%This program generates the overlapped blocks of f, 
%then computes the MDCT of each block, followed by the 
%IMDCT, then uses TDAC to reconstruct f. 

%N is the overlap size and is a preferably an even
%number that divides the length of f.  

%K is the number of sample nodes. 
%Determine sample nodes. 
    
t = [0:1/K:(K-1)/K]';

%Enter the formulas for the function.

f = a*t + b;
L = length(f);

%%Compute the block length m.
m = 2*N;

%Zero-pad x front and back.
z = zeros(N,1);
fz = [z;f;z];
Lz = length(fz);

%Compute the number of block vectors of fz. 
LdivN = (L/N) + 1;

%Compute the block vectors of fz, and 
%store them as columns of matrix XB. 

XB = zeros(m,LdivN);
B = 1;

for k = 1:LdivN
    XB(:,k) = fz(B:B+m-1);
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

%Perform the MDCT on the blocks vectors of f 
%by multiplying the matrix C into the matrix XB,
%and store results as columns of matrix CB. 

CB = C*XB

%The inverse of C is C^T: 

CI = C';

%Use C^T to find the IMDCT block vectors y by 
%multiplying the matrix C^T into the matrix CB,
%and store results as columns of the matrix YB. 

YB = CI*CB

%This loop reconstructs fz using the IMDCT and TDAC.
%The temporary column vector y is updated in the loop at
%each iteration in order to perform the TDAC steps. 

y(1:m,1) = zeros(m,1);
B = 0;

for k = 1:LdivN;
   fz_TDAC(B+1:B+N) = YB(1:N,k)+y(N+1:m);
   y = YB(1:m,k);
   B = B + N;
end

%The vector f_TDAC is extracted from the nonpadded
%middle part of the reconstructed fz_TDAC. 

f_TDAC = fz_TDAC(N+1:Lz-N)';

%For convenience of comparison, the original f is listed
%as the first column of Results_Matrix, and f_TDAC is
%listed as the second column. 

Results_Matrix_Below = ...
sprintf('The first column is f and the second column is f_TDAC.') 
Results_Matrix = [f,f_TDAC]

figure

left = -0.1;
right = 1.1;
height1 = min(0.8*min(f),1.2*min(f));
height2 = 1.2*max(f);
sr = 8;

subplot(1,2,1), timestemplot(f,1,L,sr), 
axis([left right height1 height2])
xlabel('Time (sec)'), title('Plot of Original Vector')

subplot(1,2,2), timestemplot(f_TDAC,1,L,sr), 
axis([left right height1 height2])
xlabel('Time (sec)'), title('Plot of TDAC Vector')


