function fcnplot = fcnplot(freq1,freq2)

%This function determines the inner product of two functions
%and displays their associated graphs on [a,b] x [c,d]. 

%Determine sample nodes. 
N = 10000;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the functions.

g1 = sin(2*pi*freq1*t);
g2 = sin(2*pi*freq2*t);
f = 3*g1 +2*g2;

%Compute the similarity coefficients of f relative to g.

C1 = dot(f,g1)/dot(g1,g1)
C2 = dot(f,g2)/dot(g2,g2)

%Partial plot f.

z = zeros(N,1);
a = 8/freq1;
ta = [0:a/N:a*(N-1)/N]';
fa = 3*sin(2*pi*freq1*ta)+2*sin(2*pi*freq2*ta);

figure
plot(ta,fa,'b',ta,z,'k')
title('Partial plot of f')
axis tight

