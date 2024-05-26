%This script plots the sharpwave function over [0,1].
    
%Determine sample nodes. 

N = 100;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

f(1:N/4) = 4*t(1:N/4);
f(N/4+1:3*N/4) = 1;
f(3*N/4+1:N) = 4 -4*t(3*N/4+1:N);

f = 2 - f;

%Plot the function. 


top = max(0,1.2*max(f));
bottom = min(-0.2,min(f)-0.2);
plot(t,f,'b'), axis([0 1 bottom top])

