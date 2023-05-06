function fcnplot = fcnplot(n)
    
%This program calculates and plots the Fourier coefficients
%and expansions for f and its even extension g. 
    
%Determine sample nodes. 

N = 2^9;
M = N/2;
t = [0:1/N:(N-1)/N]';
t1 = [t;1+t]';

%Enter the formula for the function.
 
f = exp(t) + 1;

%Compute the even extension of f. 

g = [f;f(N:-1:1)];

%Compute the Fourier coefficients and expansion for f.

c = 1/N*fft(f);
a = 2*real(c(2:M));
b = -2*imag(c(2:M));
a0 = real(c(1));
fn = a0;
for m = 1:(n+1)
    fn = fn + a(m)*cos(2*pi*m.*t)+ b(m)*sin(2*pi*m.*t);
end

c_f = c(1:n+1);

%Compute the Fourier coefficients and expansion for g.

c = 1/(2*N)*fft(g);
a = 2*real(c(2:N));
b = -2*imag(c(2:N));
a0 = real(c(1));
gn = a0;
for m = 1:(n+1)
    gn = gn + a(m)*cos(2*pi*m.*t1/2)+ b(m)*sin(2*pi*m.*t1/2);
end

c_g = c(1:n+1);

%Report the results and plot the functions.

coefficient_magnitudes_for_fn = abs(c_f)
coefficient_magnitudes_for_gn = abs(c_g)

subplot(2,2,1), plot(t,f,'b',t,fn,'r')
title('Plot of f with Fourier Expansion f_n')

subplot(2,2,2), plot(t1,g,'b',t1,gn,'r')
title('Plot of g with Fourier Expansion g_n')

subplot(2,2,3), stem(abs(c_f)),
title('Fourier Coefficient Magnitudes for f_n')

subplot(2,2,4), stem(abs(c_g)),
title('Fourier Coefficient Magnitudes for g_n')