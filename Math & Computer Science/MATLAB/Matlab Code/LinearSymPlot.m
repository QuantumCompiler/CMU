function fcnplot = fcnplot(a,b)

%This program computes Fourier expansion of order n,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
K = 2*N;
t = [0:1/N:(N-1)/N]';
t2 = [t;1+t];

%Enter the formulas for the function
%and convert to vertical format.

f = a*t + b;

%The formula for g will consist of f 
%followed by f in reverse order. 

g = [f;f(N:-1:1)];


%Plot f and g. 

z = zeros(N,1);
z2 = zeros(K,1);
top = max(0,1.2*max(g));
bottom = min(-0.2,min(g)-0.2);

figure
subplot(1,2,1), plot(t,f,'b',t,z,'k')
title('Original Function f(t)')
axis([0 1 bottom top])

subplot(1,2,2), plot(t2,g,'r',t2,z2,'k')
title('Symmetric Extension g(t)')
axis([0 2 bottom top])

figure
plot(t,f,'b',t,z,'k')
title('Original Function f(t)')
axis([0 1 bottom top])

figure
plot(t2,g,'r',t2,z2,'k')
title('Symmetric Extension g(t)')
axis([0 2 bottom top])





