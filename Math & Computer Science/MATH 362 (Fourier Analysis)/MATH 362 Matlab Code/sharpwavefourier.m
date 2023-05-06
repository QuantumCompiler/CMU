function fcnplot = fcnplot(n)

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f(1:N/4) = 4.*t(1:N/4);
f(N/4+1:3*N/4) = 2 - 4.*t(N/4+1:3*N/4);
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

%Report the coefficient vectors.

a_0 = a0
Coeffs = [a(1:n),b(1:n)]

%Plot the functions.

topline(1:N) = max(f)+0.2;
bottomline(1:N) = min(f)-0.2;
plot(t,topline,'k',t,bottomline,'k')
hold on
plot(t,g,'r',t,f,'b')
hold off
title('Plot of f(t) with Fourier expansion')
axis tight
