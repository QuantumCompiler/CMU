global W

%This script plots the box function expansion for N = 4.

%Determine sample nodes. 

M = 200;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = exp(t) + 1;

%The following m-file computes the box functions,
%which are stored in the columns of the M x 4 matrix W.
%W is intialized to be the zero matrix. 

W = zeros(M,4);
boxfunctions(M)

%Compute the coefficients and expansion.
clear g c
g(1:M) = zeros(M,1);
g = g';
for k = 1:4
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Report the results and plot the functions. 

c = c'

plot(t,f,'b',t,g,'r')
title('Box Function Expansion')


