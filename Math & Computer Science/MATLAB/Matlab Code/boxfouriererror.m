function fcnplot = fcnplot(n)

%Determine sample nodes. 

N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f(1:M) = 1;
f(M+1:N) = 0;
f = f';

%Compute the Fourier coefficients and expansion.

c = 1/N*fft(f);
a = 2*real(c(2:M));
b = -2*imag(c(2:M));
a0 = real(c(1));
g = a0;
for m = 1:(n+1)
    g = g + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

%Compute error vectors and mean error values.

pwae = abs(f-g);
pwse = (f-g).^2;
mae = mean(pwae);
mse = mean(pwse);

%Report the results and plot the functions.

Expansion = ...
sprintf('The order of expansion is n = %d.',n)

Errors = ...
sprintf('Mean absolute error = %f; mean square error = %f.',mae,mse)

subplot(2,2,1), plot(t,g,'r',t,f,'b')
title('Plot of f(t) with Fourier expansion')
axis tight

subplot(2,2,2), plot(t,g,'r',t,f,'b')
title('Plot of f(t) with Fourier expansion')
axis tight

subplot(2,2,3), plot(t,pwae)
title('Pointwise absolute error')
axis tight

subplot(2,2,4), plot(t,pwse)
title('Pointwise square error')
axis tight
