%This script computes the Legendre transform of of order 7 for f 
 
%Determine sample nodes. 

M = 800;
t = [-1:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = 12*t.^2 - 12;

%The following m-file computes the Legendre polynomials,
%which are stored in the columns of the 2M x 8 matrix W.
%W is intialized to be the zero matrix. 

W = zeros(2*M,n);
legendrepolynomials(M);

%Compute the coefficients and expansion.
clear g c
g(1:2*M) = zeros(2*M,1);
g = g';
for k = 1:8
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Report the results and plot the functions. 

c = c'

plot(t,f,'b',t,g,'r')
title('Legendre Polynomial Expansion')
