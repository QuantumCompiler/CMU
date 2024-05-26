function legendreplot = legendreplot(n)
global W

%This function plots the Legendre polynomial expansion 
%for n = 1,2,...,8. 

%Determine sample nodes. 

M = 200;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = 2.*t - 1;

%The following m-file computes the Legendre polynomials,
%which are stored in the columns of the M x 8 matrix W.
%W is intialized to be the zero matrix. 

W = zeros(M,n);
legendrepolynomials(M)

%Compute the coefficients and expansion.
clear g
g(1:M) = zeros(M,1);
g = g';
for k = 1:n
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Plot the functions. 

plot(t,f,'b',t,g,'r')
title('Legendre Polynomial Expansion')
