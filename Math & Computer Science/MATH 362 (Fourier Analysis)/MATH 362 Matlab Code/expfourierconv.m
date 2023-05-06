function fcnplot = fcnplot(n)
clear nargin

%Determine sample nodes. 

N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formula for the function.
%This function will already be in vertical format.

f = exp(t) + 1;

%Compute the Fourier coefficients and expansions.

c = 1/N*fft(f);
a = 2*real(c(2:M));
b = -2*imag(c(2:M));
a0 = real(c(1));

g_n = a0;
for m = 1:(n+1)
    g_n = g_n + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

g_2n = g_n;
for m = (n+2):2*(n+1)
    g_2n = g_2n + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

g_4n = g_2n;
for m = 2*n+3:4*(n+1)
    g_4n = g_4n + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

g_8n = g_4n;
for m = 4*n+5:8*(n+1)
    g_8n = g_8n + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

%Compute pointwise square error vector and mean square error values.

pwse = (f-g_n).^2;
mse(1,1) = mean(pwse);
pwse = (f-g_2n).^2;
mse(2,1) = mean(pwse);
pwse = (f-g_4n).^2;
mse(3,1) = mean(pwse);
pwse = (f-g_8n).^2;
mse(4,1) = mean(pwse);

%Report the results and plot the functions.

Expansion = ...
sprintf('The expansion orders are n = %d, %d, %d, and %d.',n,2*n,4*n,8*n)

Mean_Square_Errors = ...
sprintf('The mean square error values for the expansion orders are displayed in the following vector.')

Mean_Square_Error_Vector = mse

subplot(2,2,1), plot(t,g_n,'r',t,f,'b')
title('Plot of f with g_n')
axis tight

subplot(2,2,2), plot(t,g_2n,'r',t,f,'b')
title('Plot of f with g_2n')
axis tight

subplot(2,2,3), plot(t,g_4n,'r',t,f,'b')
title('Plot of f with g_4n')
axis tight

subplot(2,2,4), plot(t,g_8n,'r',t,f,'b')
title('Plot of f with g_8n')
axis tight