function fcnplot = fcnplot(a,b,c,d)

%This function determines the inner product of two functions
%and displays their associated graphs on [a,b] x [c,d]. 

%Determine sample nodes. 
N = 10000;
t = [0:1/N:(N-1)/N];

%Enter the formulas for the functions.

M = N/2;
f(1:M) =  3;
f(M+1:N) = 5;
g = 6*t - 1;

%Compute the inner product of the functions.

innerprod_fg = 1/N*dot(f,g)
innerprod_gg = 1/N*dot(g,g)
similarity_fg = innerprod_fg/innerprod_gg

%Plot f and g on [a,b] x [c,d].
%The vector z will be used as the x-axis.

z = zeros(N,1);

figure
plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis([a b c d])



