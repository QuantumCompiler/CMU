%This script plots the Haar wavelet expansion for N = 4.

%Determine sample nodes. 

M = 200;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f(1:M/2) = 1;
f(M/2+1:M) = -1;

%Enter formulas for the Haar wavelet functions. 

b(1:M) = 1;

w(1:M/2) = 1;
w(M/2+1:M) = -1;

wd10(1:M/4) = 1;
wd10(M/4+1:M/2) = -1;
wd10(M/2+1:M) = 0;

wd11(1:M/2) = 0;
wd11(M/2+1:3*M/4) = 1;
wd11(3*M/4+1:M) = -1;

%Compute the coefficients and expansion.

c(1) = dot(f,b)/dot(b,b);
c(2) = dot(f,w)/dot(w,w);
c(3) = dot(f,wd10)/dot(wd10,wd10);
c(4) = dot(f,wd11)/dot(wd11,wd11);

g = c(1)*b + c(2)*w + c(3)*wd10 + c(4)*wd11;

%Plot the functions. 

plot(t,f,'b',t,g,'r')
title('Plot of f with g')
axis([0 1 -1.2 1.2])