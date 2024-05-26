function fcnplot = fcnplot(N,m,n,a,b)

%This program plots two sine functions on [0,1) and
%also computes the sampled vectors and their plots. 

%The value of a is the plus or minus coefficient for f.
%The value of b is the plus or minus coefficient for g.
%The value of N is the number of nodes. 
%The value of m is the higher frequency. 
%The value of n is the higher frequency.
    
%M is a large number of nodes, used
%to graph $f$ and $g$.

M = 1000;
tM = [0:1/M:(M-1)/M]';
tN = [0:1/N:(N-1)/N]';


%Enter the formulas for the functions.

f = a*sin(2*pi*m*tM);
fN= a*sin(2*pi*m*tN)

g = b*sin(2*pi*n*tM);
gN= b*sin(2*pi*n*tN)

%Plot the functions

figure
plot(tN,fN,'rs',tM,f,'r',tN,gN,'b*',tM,g,'b')
title('Plot of f, g, f_N and g_N')
axis tight

