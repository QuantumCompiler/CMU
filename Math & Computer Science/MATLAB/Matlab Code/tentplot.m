%This script plots the tent function over [0,1].
    
%Determine sample nodes. 

N = 100;
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

f(1:M) = 2*t(1:M);
f(M+1:N) = 2-2*t(M+1:N);

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 -0.2 1.2])


