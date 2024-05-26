%This script determines the similarity coefficient 
%for f relative to g, and displays associated graphs. 

%Determine sample nodes. 
N = 10000;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the functions.

f = 3*sin(2*pi*440.*t)+2*sin(2*pi*554.37.*t)+sin(2*pi*659.26.*t);
g = sin(2*pi*661.*t);

%Compute the similarity coefficient of f relative to g.

similarity_coefficient = dot(f,g)/dot(g,g)

%Partial plot f and g and also their pointwise product.

z = zeros(N,1);
a = 5/440;
t = [0:a/N:a*(N-1)/N]';
f = 3*sin(2*pi*440.*t)+2*sin(2*pi*554.37.*t)+sin(2*pi*659.26.*t);
g = sin(2*pi*661.*t);
prod = f.*g;

figure
plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis tight

figure
subplot(1,2,1), plot(t,f,'b',t,g,'r',t,z,'k')
title('Plot of f with g')
axis tight

subplot(1,2,2), plot(t,prod,t,z,'k')
title('Pointwise product f.*g')
axis tight