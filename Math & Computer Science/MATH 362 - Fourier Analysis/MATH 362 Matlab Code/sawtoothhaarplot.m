global W

%This script plots the Haar wavelet expansion for N = n,
%where n = 1,2,4,8. 

%Determine sample nodes. 

M = 400;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = 2.*t - 1;

%The following m-file computes the Haar wavelet functions,
%which are stored in the columns of the M x n matrix W.

W = zeros(M,8);
haarfunctions(M)

%Next, compute the coefficients and Haar wavelet expansion.

for k = 1:8
    c(k) = dot(f,W(:,k))/dot(W(:,k),W(:,k))';
end

clear g

g1 = c(1)*W(:,1);
g2 = g1 + c(2)*W(:,2);

g3 = g2;
for k = 3:4
    g3 = g3 + c(k)*W(:,k);
end

g4 = g3;
for k = 5:8
    g4 = g4 + c(k)*W(:,k);
end

%Plot the functions. 

c = min(f)-0.2;
d = max(f)+0.2;

subplot(2,2,1), plot(t,f,'b',t,g1,'r')
title('Haar wavelet approximation (n = 1)')
axis([0 1 c d])

subplot(2,2,2), plot(t,f,'b',t,g2,'r')
title('Haar wavelet approximation (n = 2)')
axis([0 1 c d])

subplot(2,2,3), plot(t,f,'b',t,g3,'r')
title('Haar wavelet approximation (n = 4)')
axis([0 1 c d])

subplot(2,2,4), plot(t,f,'b',t,g4,'r')
title('Haar wavelet approximation (n = 8)')
axis([0 1 c d])