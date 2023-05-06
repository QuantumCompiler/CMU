%This script plots the sawtooth function over [0,1].
    
%Determine sample nodes. 

N = 100;
t = [0:1/N:(N-1)/N]';

%Enter formula for function. 

f = 2.*t - 1;

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 -1.2 1.2])