%This script plots the box function over [0,1].
    
%Determine sample nodes. 

N = 600;
M = N/2;
t = [-1:1/N:5*(N-1)/N]';
Lt = length(t);

%Enter formulas for function. 

f(1:Lt) = 1/3*t.^3-2*t.^2+2;

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([-1 5 -10 3])


