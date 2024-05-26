global W

%This script plots the Legendre polynomial expansion for N = n,
%where n = 1,3,5,7. 

%Determine sample nodes. 

M = 400;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = 2.*t - 1;

%The following m-file computes the Haar wavelet functions,
%which are stored in the columns of the M x n matrix W.

W = zeros(M,8);
legendrepolynomials(M)

%Next, compute the coefficients and Haar wavelet expansion.

for k = 1:8
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
end

clear g

g1 = 0;
for k = 1:2
    g1 = g1 + c(k)*W(:,k);
end

g2 = g1;
for k = 3:4
    g2 = g2 + c(k)*W(:,k);
end

g3 = g2;
for k = 5:6
    g3 = g3 + c(k)*W(:,k);
end

g4 = g3;
for k = 7:8
    g4 = g4 + c(k)*W(:,k);
end

%Plot the functions. 

subplot(2,2,1), plot(t,f,'b',t,g1,'r')
title('Legendre polynomial approximation (n = 1)')
axis tight

subplot(2,2,2), plot(t,f,'b',t,g2,'r')
title('Legendre polynomial approximation (n = 3)')
axis tight

subplot(2,2,3), plot(t,f,'b',t,g3,'r')
title('Legendre polynomial approximation (n = 5)')
axis tight

subplot(2,2,4), plot(t,f,'b',t,g4,'r')
title('Legendre polynomial approximation (n = 7)')
axis tight