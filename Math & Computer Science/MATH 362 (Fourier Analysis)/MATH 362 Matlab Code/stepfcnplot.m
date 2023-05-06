%This script plots the graph of a function over [0,1].
    
%Determine sample nodes. 

N = 400;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

a = 6;
b = 2;
c = 4;
d = 8;

f(1:N/4) = a;
f(N/4+1:N/2) = b;
f(N/2+1:3*N/4) = c;
f(3*N/4+1:N) = d;

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 0 10])

