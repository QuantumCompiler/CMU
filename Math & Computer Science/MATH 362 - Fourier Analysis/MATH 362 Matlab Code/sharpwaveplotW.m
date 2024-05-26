%This script plots the sharpwave function over [0,1].
    
%Determine sample nodes. 

N = 100;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

f(1:N/4) = -4*t(1:N/4);
f(N/4+1:2*N/4) = -2 + 4*t(N/4+1:2*N/4);
f(2*N/4+1:3*N/4) = 2 - 4*t(2*N/4+1:3*N/4);
f(3*N/4+1:N) = -4 + 4*t(3*N/4+1:N);

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 -1.2 1.2])

