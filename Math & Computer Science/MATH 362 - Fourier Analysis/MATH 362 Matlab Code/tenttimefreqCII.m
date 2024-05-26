function fcnplot = fcnplot(n)

%This program computes Fourier expansion of order n,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';
t2 = [t;1+t];

%Enter the formulas for the function f
%and convert to vertical format.

f(1:M) = 2.*t(1:M);
f(M+1:N) = 2-2.*t(M+1:N);
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

%Plot the time and frequency domain graphs. 

figure
subplot(1,2,1), plot(t2,h,'r',t2,g,'b')
title('Plot of f(t) with Fourier expansion')
axis tight

subplot(1,2,2),  stem(cmag)
title('Fourier Coefficient Magnitudes')

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



