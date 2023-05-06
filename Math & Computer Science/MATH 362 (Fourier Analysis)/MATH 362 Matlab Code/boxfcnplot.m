%This script plots the box function over [0,1].
    
%Determine sample nodes. 

N = 100;
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

boxf(1:M) = 1;
boxf(M+1:N) = 0;

%Plot the function. 

plot(t,boxf,'b')
title('Plot of f(t)')
axis([0 1 -0.2 1.2])

