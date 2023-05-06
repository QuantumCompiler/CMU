function legendreplot = legendreplot(n)
global W

%This function plots the Legendre polynomial expansion 
%for n = 1,2,...,8. 

%Determine sample nodes. 

M = 200;
t = [-1:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = exp(t)+1;

%The following m-file computes the Legendre polynomials,
%which are stored in the columns of the 2M x 8 matrix W.
%W is intialized to be the zero matrix. 

W = zeros(2*M,n);
legendrepolynomials(M)

%Compute the coefficients and expansion.
clear g c
g(1:2*M) = zeros(2*M,1);
g = g';
for k = 1:n
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Report the results and plot the functions. 

c = c'

plot(t,f,'b',t,g,'r')
title('Legendre Polynomial Expansion')
plot(t,f,'b',t,g,'r')
title('Legendre Polynomial Expansion')
axis tight