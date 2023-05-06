function fcnplot = fcnplot(p)

%This program plots the periodic extension f_p for the 
%box function over [-1,3], which is an interval of length 4.
    
%Determine sample nodes. 

N = 1000;
M1 = N/8;
M2 = N/4;
t = [-2:1/N:(N-1)/N*4]';

%Enter formulas for function. 

if 0 < p <= 0.5 
    f = 1;
elseif 0.5 < p <= 1
    m = round(p*M2);
    for B = 1..7
    f(1:M2) = 1;
    f(M1:2*M1) = 0;
    f(2*M1+1:3*M1)=1;
    f(3*M1+1:4
boxf(1:M) = 1;
boxf(M+1:N) = 0;

%Plot the function. 

plot(t,boxf,'b')
title('Plot of f(t)')
axis([0 1 -0.2 1.2])

