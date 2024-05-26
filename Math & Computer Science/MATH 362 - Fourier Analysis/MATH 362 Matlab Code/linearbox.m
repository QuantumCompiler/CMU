%This function computes the coefficients for the 
%box function expansion of f, for N = 4. 

%Determine sample nodes. 

M = 1000;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = t + 1;

%Enter the formulas for the box functions next.

b1(1:M/4) = 1;
b1(M/4+1:M) = 0;

b2(1:M/4) = 0;
b2(M/4+1:2*M/4) = 1;
b2(2*M/4+1:M) = 0;

b3(1:2*M/4) = 0;
b3(2*M/4+1:3*M/4) = 1;
b3(3*M/4+1:M) = 0;

b4(1:3*M/4) = 0;
b4(3*M/4+1:M) = 1;

%Compute the coefficients 

c1 = dot(f,b1)/dot(b1,b1);
c2 = dot(f,b2)/dot(b2,b2);
c3 = dot(f,b3)/dot(b3,b3);
c4 = dot(f,b4)/dot(b4,b4);

%Compute the expansion.

g = c1*b1 + c2*b2 + c3*b3 + c4*b4

%Report the results and plot the functions. 

coeffs = [c1,c2,c3,c4]'

plot(t,f,'b',t,g,'r')
title('Plot of f with g')
axis([a b c d])


