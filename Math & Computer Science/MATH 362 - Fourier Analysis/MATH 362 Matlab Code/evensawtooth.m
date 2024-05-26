%This script plots the even extension of the function.

%Determine sample nodes. 

N = 200;
t = [0:1/N:(N-1)/N]';
t1 = [t;1+t]';

%Enter the formula for the function.
 
f = 2.*t - 1;

%Compute and plot the even extension. 

g = [f;f(N:-1:1)];

z = zeros(N,1);
z1 = [z;z];

figure
subplot(1,2,1), plot(t,f,'b',t,z,'k')
title('Original Function')

subplot(1,2,2), plot(t1,g,'r',t1,z1,'k')
title('Even Extension')