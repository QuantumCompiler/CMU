%This script plots the a piecewise function over [0,1].
    
%Determine sample nodes. 

N = 100;
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

f(1:M) = 8*t(1:M)-3;
f(M+1:N) = 5-8*t(M+1:N);
f = f';

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis tight
%axis([0 1 -4 4])

