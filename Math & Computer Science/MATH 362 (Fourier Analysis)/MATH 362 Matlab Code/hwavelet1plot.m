%This script plots the first N = 4 Haar wavelet function. 

%Determine sample nodes. 

N = 800;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

clear f
f(1:N) = 1;

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([-0.1 1.1 0 1.2])

