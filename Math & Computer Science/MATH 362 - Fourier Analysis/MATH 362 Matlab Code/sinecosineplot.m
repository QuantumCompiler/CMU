function fcnplot = fcnplot(A,B,T)

%This m-file plots sine and cosine functions over [0,T],
%where the A is the amplitude (vertical scaling factor)
%and B multiplies t (horizontal scaling factor).
    
%Determine sample nodes. 

N = 100;
t = [0:T/N:T*(N-1)/N]';

%Enter formula for function. 

f = A*sin(B.*t);
g = A*cos(B.*t);

%Plot the functions. 

plot(t,f,'b',t,g,'--r')
title('Plot of f and g')
axis([0 T -A-0.2 A+0.2])