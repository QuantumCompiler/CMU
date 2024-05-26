function fcnplot = fcnplot(a,b,n)

%This program computes Fourier expansion of order n,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f = a*t + b;

%Compute the Fourier coefficients and expansion.

c = 1/N*fft(f);
a = 2*real(c(2:M));
b = -2*imag(c(2:M));
a0 = real(c(1));
g = a0;
for m = 1:n
    g = g + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

cmag = abs(c(1:n+1));

%Report the coefficient vectors.

Coeff_a0_for_f = a0
Coeffs_ak_bk_for_f = [a(1:n),b(1:n)]

%Plot the time and frequency domain graphs. 

z = zeros(N,1);
top = max(0,1.2*max(g));
bottom = min(-0.2,min(g)-0.2);
height = 1.2*max(cmag);
right = n+1;


figure
subplot(1,2,1), plot(t,g,'r',t,f,'b',t,z,'k')
title('Plot of f(t) with Fourier expansion')
axis([0 1 bottom top])

subplot(1,2,2),  stem(cmag)
title('Fourier Coefficient Magnitudes')
axis([-0.5 right 0 height])






