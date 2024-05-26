function fcnplot = fcnplot(a,b,N)

%This program plots the time domain plot of a function on [a,b). 
    
%Determine sample nodes. 

t = [a:1/N:(N-1)/N*b]';

%Enter the formulas for the functions.

f= sin(2*pi*3*t);

%Plot the function

plot(t,f,'b')
title('Plot of f')
axis tight

