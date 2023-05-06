%This script determines the inner product of two functions
%and displays associated graphs. 

%Determine sample nodes. 
N = 200;
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the functions.

f = sin(2*pi*t);
g = cos(2*pi*t);

%Compute the inner product of the functions.

innerprod = 1/N*dot(f,g)

%Plot f and g and also their pointwise product.

prod = f.*g;
z = zeros(N,1);

figure
plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis tight

figure
plot(t,prod,t,z,'k')
title('Pointwise product f.*g')
axis tight

figure
subplot(1,2,1), plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis tight

subplot(1,2,2), plot(t,prod,t,z,'k')
title('Pointwise product f.*g')
axis tight


