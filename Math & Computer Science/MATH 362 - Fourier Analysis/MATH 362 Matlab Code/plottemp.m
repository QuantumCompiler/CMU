function fcnplot = fcnplot(freq1,freq2)

%This program computes Fourier coefficients of f,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function.

f1(1:N) = sin(2*pi*freq1*t(1:N));
f2(1:N) = sin(2*pi*freq2*t(1:N));
f = [f1,f2]';
t2 = [0:1/N:2*(N-1/2)/N]';

plot(t2,f,'b')
title('Time Domain Plot of f(t)')
axis auto


