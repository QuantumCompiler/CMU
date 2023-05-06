%This script plots the windowed even-odd extension of the function.

%Determine sample nodes. 

N = 200;
t = [0:1/N:(N-1)/N]';
t1 = [t;1+t;2+t;3+t]';

%Enter the formula for the function.
 
f = 2.*t - 1;

%Enter the formula for the windowed function.
 
wf = sin(pi*t).*(2.*t - 1);

%Compute the even-odd extension of the function. 

g = [f;-f(N:-1:1);-f;f(N:-1:1)];

%Compute the even-odd extension of the windowed function. 

wg = [wf;-wf(N:-1:1);-wf;wf(N:-1:1)];

%Plot the functions. 

subplot(2,2,1), plot(t,f,'b')
title('Original Function')

subplot(2,2,2), plot(t1,g,'r')
title('Even-Odd Extension of Function')

subplot(2,2,3), plot(t,wf,'b')
title('Windowed Function')

subplot(2,2,4), plot(t1,wg,'r')
title('Even-Odd Extension of Windowed Function')