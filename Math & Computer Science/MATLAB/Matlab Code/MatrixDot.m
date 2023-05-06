function MatrixDot = MatrixDot(A,B) 

%This program computes the matrix dot product of A and B. 
%A and B need to have the same dimensions: M x N. 

[M,N] = size(A);

AdotB = 0;

%This loop computes the matrix dot product by adding
%together dot products of corresponding row vectors.

for i = 1:M
    AdotB = AdotB + dot(A(i,:),B(i,:));
end

MatrixDot = AdotB;




