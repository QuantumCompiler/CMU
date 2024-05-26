function fcnplot = fcnplot(n)

%This program computes Fourier expansion of order n,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';
t2 = [t;1+t];

%Enter the formulas for the function f.

f(1:M) = 4;
f(M+1:N) = 3 + 2*t(M+1:N);
f = f';

%The formula for g will consist of f 
%followed by f in reverse order. 

g = [f;f(N:-1:1)];

%Compute the Fourier coefficients and expansion of g.

K = 2*N;
c = 1/K*fft(g);
a = 2*real(c(2:N));
b = -2*imag(c(2:N));
a0 = real(c(1));
h = a0;
for m = 1:n
    h = h + a(m)*cos(2*pi*m.*t2/2)+ b(m)*sin(2*pi*m.*t2/2);
end

cmag = abs(c(1:n+1));

%Report the coefficient vectors.

Coeff_a_0 = a0
Coeffs_ak_bk = [a(1:n),b(1:n)]

%Plot the time and frequency domain graphs. 

z = zeros(N,1);
z2 = zeros(K,1);
top = max(0,1.2*max(g));
bottom = min(-0.2,min(g)-0.2);
height = 1.2*max(cmag);
right = n+1;

figure
subplot(1,2,1), plot(t,f,'b',t,z,'k')
title('Original Function')
axis([0 1 bottom top])

subplot(1,2,2), plot(t2,g,'r',t2,z2,'k')
title('Even Extension')
axis([0 2 bottom top])

figure
subplot(1,2,1), plot(t2,h,'r',t2,g,'b',t2,z2,'k')
title('Plot of g(t) with Fourier expansion')
axis([0 2 bottom top])

subplot(1,2,2),  stem(cmag)
title('Fourier Coefficient Magnitudes')
axis([-0.5 right 0 height])



