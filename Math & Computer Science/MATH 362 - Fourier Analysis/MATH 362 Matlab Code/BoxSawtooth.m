function fcnplot = fcnplot(ymin,ymax)

%This function computes the coefficients for the 
%box function expansion of f, for N = 4. 
%The viewing window for graph is [0,1]x[ymin,ymax]. 

%Determine sample nodes. 

M = 1000;
t = [0:1/M:(M-1)/M]';

%Enter the formula for the function.
 
f = 2*t - 1;

%Enter the formulas for the box functions next.

B1(1:M/4) = 1;
B1(M/4+1:M) = 0;

B2(1:M/4) = 0;
B2(M/4+1:2*M/4) = 1;
B2(2*M/4+1:M) = 0;

B3(1:2*M/4) = 0;
B3(2*M/4+1:3*M/4) = 1;
B3(3*M/4+1:M) = 0;

B4(1:3*M/4) = 0;
B4(3*M/4+1:M) = 1;

%Compute the coefficients 

c1 = dot(f,B1)/dot(B1,B1);
c2 = dot(f,B2)/dot(B2,B2);
c3 = dot(f,B3)/dot(B3,B3);
c4 = dot(f,B4)/dot(B4,B4);

%Compute the expansion.

g = c1*B1 + c2*B2 + c3*B3 + c4*B4;

%Report the results and plot the functions. 

coeffs = [c1,c2,c3,c4]

z = zeros(M,1);

figure
plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis([0 1 ymin ymax])

