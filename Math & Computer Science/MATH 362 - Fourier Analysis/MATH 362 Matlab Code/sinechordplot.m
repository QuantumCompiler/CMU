function fcnplot = fcnplot(freq1,freq2,freq3,T)

%This m-file plots a musical chord function over [0,T],
%assuming three frequencies present.
    
%Determine sample nodes. 

N = 1000;
t = [0:T/N:T*(N-1)/N]';

%Enter formula for function. 

f = sin(2*pi*freq1.*t)+sin(2*pi*freq2.*t)+sin(2*pi*freq3.*t);

%Plot the function. 

plot(t,f,'b')
title('Plot of f')
axis([0 T -3 3])