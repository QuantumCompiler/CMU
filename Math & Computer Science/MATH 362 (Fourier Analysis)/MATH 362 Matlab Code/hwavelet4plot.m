

%Determine sample nodes. 

N = 200;
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter formulas for function. 

f(1:M) = 0;
f(M+1:3*M/2) = 1;
f(3*M/2+1:N) = -1;

%Plot the function. 

plot(t,f,'b')
title('Plot of f(t)')
axis([0 1 -1.2 1.2])

