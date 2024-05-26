%This script computes the similarity coefficents for the
%box function expansion for N = 4 and plots the expansion.

global W

%Determine sample nodes. 

M = 800;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f(1:M) = t+1;

%The following m-file computes the box functions,
%which are stored in the columns of the M x 4 matrix W.

W = zeros(M,4);
boxfunctions(M);

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
title('Plot of f with g')
axis([0 1 0 2.2])