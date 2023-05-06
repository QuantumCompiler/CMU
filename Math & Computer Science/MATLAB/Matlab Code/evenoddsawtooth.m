%This script plots the even-odd extension of the function.

%Determine sample nodes. 

N = 200;
t = [0:1/N:(N-1)/N]';
t1 = [t;1+t;2+t;3+t]';

%Enter the formula for the function.
 
f = 2.*t - 1;

%Compute and plot the even-odd extension. 

g = [f;-f(N:-1:1);-f;f(N:-1:1)];

subplot(1,2,1), plot(t,f,'b')
title('Original Function')

subplot(1,2,2), plot(t1,g,'r')
title('Even-Odd Extension')