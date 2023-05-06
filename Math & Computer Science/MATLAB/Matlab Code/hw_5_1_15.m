function fcnplot = fcnplot(N,k)

%This program plots the time domain plot of a function on [a,b).
%The value of N is the number of nodes, and k is the frequency of f. 
    
%Determine sample nodes. 

K = 100;
tN = [0:1/N:(N-1)/N]'
t = [0:1/K:(K-1)/K]';

%Enter the formulas for the functions.

fN= sin(2*pi*k*tN)
f = sin(2*pi*k*t);

%Plot the function

plot(tN,fN,'bo',t,f,'r')
title('Plot of f and f_N')
axis tight

