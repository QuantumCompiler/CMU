function fcnplot = fcnplot(a,b,c,d)

%This function determines the inner product of two functions
%and displays their associated graphs on [a,b] x [c,d]. 

%Determine sample nodes. 
N = 10000;
t = [0:1/N:(N-1)/N];

%Enter the formulas for the functions.

M = N/2;
f(1:M) = 1;
f(M+1:N) = -1;
g(1:M) = 2*t(1:M);
g(M+1:N) = 2-2*t(M+1:N);

%Compute the inner product of the functions.

innerprod = 1/N*dot(f,g)

%Plot f and g on [a,b] x [c,d].
%The vector z will be used as the x-axis.

z = zeros(N,1);

figure
plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis([a b c d])



