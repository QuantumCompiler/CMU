function fcnplot = fcnplot(S,T)

%This program plots the window used for the CT IV. 

%Determine sample nodes. 
    
N = 2^(10);
t = [0:1/N:(N-1)/N]';

%Enter the formula for the window function.

w = sin(pi/T*(t + S));

%Plot the time and frequency domain graphs. 

z = zeros(N,1);
top = max(0,1.2*max(w));
bottom = min(-0.2,min(w)-0.2);

figure
plot(t,w,'b',t,z,'k')
title('CT IV Window Function')
axis([0 1 0 top])




