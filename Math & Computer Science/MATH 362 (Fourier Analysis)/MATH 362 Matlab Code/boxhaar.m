function haarplot = haarplot(n)
global W

%This function plots the Haar wavelet expansion for N = n,
%where n = 1,2,4,8. 

%Determine sample nodes. 

M = 200;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f(1:M/2) = 1;
f(M/2+1:M) = 0;

%The following m-file computes the Haar wavelet functions,
%which are stored in the columns of the M x 8 matrix W.

W = zeros(M,8);
haarfunctions(M)

%Compute the coefficients and expansion.
clear g c
g(1:M) = zeros(M,1);
g = g';
for k = 1:n
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Report the results and plot the functions. 

c = c'

plot(t,f,'b',t,g,'r')
title('Plot of f with g')
axis([0 1 -0.2 1.2])