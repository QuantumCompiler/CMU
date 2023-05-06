function fcnplot = fcnplot(n)

%This program computes Fourier expansion of order n,
%and plots the time and frequency domain graphs. 

%Initialize T value

T = 1;

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f = 1 + sin(2*pi*t).*cos(8*pi.*t);

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

%Plot the time and frequency domain graphs. 

height = 1.2*max(cmag);
right = n+1;

figure
subplot(1,2,1), plot(t,g,'r',t,f,'b')
title('Plot of f(t) with Fourier expansion')
axis auto

subplot(1,2,2),  stemfft(cmag,T)
title('Fourier Coefficient Magnitudes')
axis([-0.5 right 0 height])

figure
plot(t,g,'r',t,f,'b')
title('Plot of f(t) with Fourier expansion')
axis auto

figure
stemfft(cmag,T)
title('Fourier Coefficient Magnitudes')
axis([-0.5 right 0 height])


