function haarsaw = haarsaw(ymin,ymax)

%This program computes the coefficients for the 
%Haar wavelet expansion of f, for N = 4. 
%The viewing window for graph is [0,1]x[ymin,ymax].

%Determine sample nodes. 

M = 1000;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = 2.*t - 1;

%The following commands generates the Haar wavelet functions,
%which are stored in the columns of the matrix W.

W(1:M,1) = 1;

W(1:M/2,2) = 1;
W(M/2+1:M,2) = -1;

W(1:M/4,3) = 1;
W(M/4+1:M/2,3) = -1;
W(M/2+1:M,3) = 0;

W(1:M/2,4) = 0;
W(M/2+1:3*M/4,4) = 1;
W(3*M/4+1:M,4) = -1;

%Next, compute the coefficients and Haar wavelet expansion.

clear g c
g(1:M) = zeros(M,1);
g = g';
for k = 1:4
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
    g = g + c(k)*W(:,k);
end

%Report the results and plot the functions. 

c = c'

figure
plot(t,f,'b',t,g,'r')
title('Plot of f with g')
axis([0 1 ymin ymax])

