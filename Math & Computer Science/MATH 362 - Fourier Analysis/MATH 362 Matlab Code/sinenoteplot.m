function fcnplot = fcnplot(freq,T)

%This m-file plots a musical note function over [0,T],
%where freq is the frequency of the note.
    
%Determine sample nodes. 

N = 2000;
t = [0:T/N:T*(N-1)/N]';

%Enter formula for function. 

f = sin(2*pi*freq*t);

%Plot the function. 

plot(t,f,'b')
title('Plot of f')
axis([0 T -1.2 1.2])