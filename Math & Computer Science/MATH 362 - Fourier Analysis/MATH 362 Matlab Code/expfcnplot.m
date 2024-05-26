%This script plots the exponential function over [0,1].
    
%Determine sample nodes. 

N = 100;
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter formula for function. 

f = exp(t) + 1;

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 0 4])