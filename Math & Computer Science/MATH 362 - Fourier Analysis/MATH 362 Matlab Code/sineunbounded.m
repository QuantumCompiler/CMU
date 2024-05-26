%This script plots the damped oscillatory sine function over [0,1].
    
%Determine sample nodes. 

N = 1000;
t = [0:1/N:(N-1)/N]';

%Enter formula for function. 

f = t.*sin(1./t);

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 -0.4 1])