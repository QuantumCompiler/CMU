%This script determines the similarity coefficient 
%for f relative to g, and displays associated graphs. 

%Determine sample nodes. 
N = 1000;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the functions.

f = cos(2*pi*t);
g = cos(2.8*pi*t);

%Compute the similarity coefficient of f relative to g.

similarity_coefficient = dot(f,g)/dot(g,g)

%Plot f and g and also their pointwise product.

prod = f.*g;
z = zeros(N,1);

subplot(1,2,1), plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis tight

subplot(1,2,2), plot(t,prod,t,z,'k')
title('Pointwise product f.*g')
axis tight