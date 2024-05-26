function C = DCTIImatrix(N);
global C

%This program computes the NxN DCTII matrix. 

for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1));
    end
end
   
C(1,:) = sqrt(1/2)*C(1,:);
C = sqrt(2/N)*C;


