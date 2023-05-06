%This script plots the Haar wavelet expansion for N = 4.

%Determine sample nodes. 

M = 200;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f(1:M/2) = 1;
f(M/2+1:M) = 0;

%Enter formulas for the Haar wavelet functions,
%and store them as columns in a matrix W. 

W(1:M,1) = 1;

W(1:M/2,2) = 1;
W(M/2+1:M,2) = -1;

W(1:M/4,3) = 1;
W(M/4+1:M/2,3) = -1;
W(M/2+1:M,3) = 0;

W(1:M/2,4) = 0;
W(M/2+1:3*M/4,4) = 1;
W(3*M/4+1:M,4) = -1;

%Compute the coefficients and expansion.
clear g
g(1:M) = zeros(M,1);
g = g';
for k = 1:4
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Plot the functions. 

plot(t,f,'b',t,g,'r')
title('Plot of f with g')
axis([0 1 0 1.2])