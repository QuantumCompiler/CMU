function fcnplot = fcnplot(n)

%Determine sample nodes. 
    
N = 2^(10);
K = 2*N;
t = [0:1/K:(K-1)/K]';

%Enter the formula for the function.
%This function will already be in vertical format.

M = N/2;
f(1:M) = 1;
f(M+1:2*M) = 0;
f(2*M+1:3*M) = 1;
f(3*M+1:K) = 0;
f = f';

%Compute the Fourier coefficients and expansion.

c = 1/K*fft(f);
a = 2*real(c(2:N));
b = -2*imag(c(2:N));
a0 = real(c(1));
g = a0;
for m = 1:n
    g = g + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

%Plot the functions.
z = zeros(K,1);
topline(1:K) = max(f)+0.2;
bottomline(1:K) = min(f)-0.2;
plot(t,topline,'k',t,bottomline,'k')
hold on
plot(t,g,'r',t,f,'b',t,z,'k')
hold off
title('Plot of f(t) with Fourier expansion')
axis tight