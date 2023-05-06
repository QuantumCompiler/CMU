function  DotMatrix =  DotMatrix(A,B)

%The matrices A and B need to have the same dimension. 
%We will use their dimensions for the inner product. 

[m,n] = size(A);

%Initialize the vectors x and y as column vector of zeros.
x = zeros(m*n,1);
y = zeros(m*n,1);

% Overwrite x & y with the entries of A & B, respectively. 
% This is done by taking the columns of A & B and inserting
% them, one after the other, into x & y, respectively. 


for j = 1:n
x((j-1)*m+1:j*m) = A(:,j);
y((j-1)*m+1:j*m) = B(:,j);
end

%Now compute the inner product of x and y.  
%The result is the inner product of A and B. 

innerproduct = dot(x,y)







