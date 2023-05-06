function fcnplot = fcnplot(a,b,c,d)

%This function determines the inner product of two functions
%and displays their associated graphs on [a,b] x [c,d]. 

%Determine sample nodes. 
N = 10000;
M = N/2;
t = [0:1/N:(N-1)/N];

%Enter the formulas for the functions.

f(1:M) = 3;
f(M+1:N) = 5;
g = 6*t - 1;

%Compute the inner product of the functions.

innerprod = 1/N*dot(f,g)

%Plot f and g on [a,b] x [c,d].
%The vector z will be used as the x-axis.

z = zeros(N,1);

figure
plot(t,f,'b',t,z,'k')
title('Plot of f')
axis([a b c d])

figure
plot(t,g,'r',t,z,'k')
title('Plot of g')
axis([a b c d])

%subplot(1,2,1), plot(t,f,'b',t,g,'r',t,z,'k')
%title('Plot of f with g')
%axis([0 1 -2 6])

%subplot(1,2,2), plot(t,prod,t,z,'k')
%title('Pointwise product f.*g')
%axis tight


