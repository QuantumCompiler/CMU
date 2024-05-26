%This script determines the inner product of two functions
%and displays associated graphs. 

%Determine sample nodes. 
N = 200;
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the functions.

%We obtain the formulas for the HW problem from 
%squarewaveplot and sharpwaveplot.

f(1:M) = 1;
f(M+1:N) = -1;
g(1:N/4) = 4.*t(1:N/4);
g(N/4+1:3*N/4) = 2 - 4.*t(N/4+1:3*N/4);
g(3*N/4+1:N) = -4 + 4.*t(3*N/4+1:N);


%Compute the inner product of the functions.

innerprod = 1/N*dot(f,g)

%Plot f and g and also their pointwise product.

prod = f.*g;
z = zeros(N,1);

subplot(1,2,1), plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis ([0 1 -1.2 1.2])

subplot(1,2,2), plot(t,prod,t,z,'k')
title('Pointwise product f.*g')
axis ([0 1 -1.2 1.2])



