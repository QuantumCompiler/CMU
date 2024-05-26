function fcnplot = fcnplot(N)

%N must be even. 

%Determine sample nodes. 
    
t = [0:1/N:(N-1)/N]';

%Enter the formula for the function.
%This function will already be in vertical format.

f = 2*t - 1;

%Compute the Fourier coefficients and expansion.

M = N/2;
a = zeros(M,1);
b = zeros(M,1);

c = 1/N*fft(f);
a(1) = real(c(1));
a(2:M) = 2*real(c(2:M));
b(2:M) = -2*imag(c(2:M));
cmag = abs(c(1:M));

%Report the coefficient vectors.

Coeff_a_0 = a(1)
Coeffs_ak_bk = [a(2:M),b(2:M)]

%Plot the frequency domain.

height = 1.2*max(cmag);
right = M+1;

stem(cmag)
title('Fourier Coefficient Magnitudes')
axis([-0.5 right 0 height])



