%This script plots the sharpwave function over [0,1].
    
%Determine sample nodes. 

N = 100;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

f(1:N/4) = 1;
f(N/4+1:2*N/4) = -0.5+6*t(N/4+1:2*N/4);
f(2*N/4+1:3*N/4) = 5.5-6*t(2*N/4+1:3*N/4);
f(3*N/4+1:N) = 1;

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 0 4])

