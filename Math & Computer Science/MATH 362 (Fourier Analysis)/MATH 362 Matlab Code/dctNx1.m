function dctNx1 = dctNx1(x)
%This function assumes that x is a column vector

N = length(x);
y = [x;x(N:-1:1)];
z = fft(y);
d = real(z(1:N).*exp(-pi*i*(1:N)'/(2*N))/(2*sqrt(N/2)));
d(1) = d(1)/sqrt(2)
