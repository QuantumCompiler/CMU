function fcnplot = fcnplot(n)

%This program computes Fourier expansion of order n,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f(1:N/4) = -4.*t(1:N/4);
f(N/4+1:2*N/4) = -2 + 4.*t(N/4+1:2*N/4);
f(2*N/4+1:3*N/4) = 2 - 4.*t(2*N/4+1:3*N/4);
f(3*N/4+1:N) = -4 + 4.*t(3*N/4+1:N);
f = f';

%Compute the Fourier coefficients and expansion.

c = 1/N*fft(f);
a = 2*real(c(2:M));
b = -2*imag(c(2:M));
a0 = real(c(1));
g = a0;
for m = 1:n
    g = g + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

cmag = abs(c(1:n+1));

%Plot the time and frequency domain graphs. 

height = 1.2*max(cmag);
right = n+1;

figure
subplot(1,2,1), plot(t,g,'r',t,f,'b')
title('Plot of f(t) with Fourier expansion')
axis tight

subplot(1,2,2),  stem(cmag)
title('Fourier Coefficient Magnitudes')
axis([-0.5 right 0 height])

figure
plot(t,f,'b')
title('y = f(t)')
axis([0 1 -1 1])

%figure
%topline(1:N) = max(g)+0.1;
%bottomline(1:N) = min(g)-0.1;
%plot(t,topline,'k',t,bottomline,'k')
%hold on
%plot(t,g,'r',t,f,'b')
%hold off
%title('Plot of f(t) with Fourier expansion')
%axis tight

%figure
%stem(cmag)
%title('Fourier Coefficient Magnitudes')
%axis([-0.5 right 0 height])



