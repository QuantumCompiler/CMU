function fcnplot = fcnplot(n)
    
%This program calculates and plots the Fourier coefficients
%and expansions for f and its even-odd extension g. 
    
%Determine sample nodes. 

N = 2^9;
M = N/2;
t = [0:1/N:(N-1)/N]';
t1 = [t;1+t;2+t;3+t]';

%Enter the formula for the function.
 
f = exp(t) + 1;

%Enter the formula for the windowed function.
 
wf = sin(pi*t).*(exp(t) + 1);

%Compute the even-odd extension of the function. 

g = [f;-f(N:-1:1);-f;f(N:-1:1)];

%Compute the even-odd extension of the windowed function. 

wg = [wf;-wf(N:-1:1);-wf;wf(N:-1:1)];

%Compute the Fourier coefficients and expansion for g.

c = 1/(4*N)*fft(g);
a = 2*real(c(2:N));
b = -2*imag(c(2:N));
a0 = real(c(1));
gn = a0;
for m = 1:(n+1)
    gn = gn + a(m)*cos(2*pi*m.*t1/4)+ b(m)*sin(2*pi*m.*t1/4);
end

c_g = c(1:n+1);

%Compute the Fourier coefficients and expansion for wg.

c = 1/(4*N)*fft(wg);
a = 2*real(c(2:M));
b = -2*imag(c(2:M));
a0 = real(c(1));
wgn = a0;
for m = 1:(n+1)
    wgn = wgn + a(m)*cos(2*pi*m.*t1/4)+ b(m)*sin(2*pi*m.*t1/4);
end

c_wg = c(1:n+1);

%Report the results and plot the functions.

coefficient_magnitudes_for_gn = abs(c_g)
coefficient_magnitudes_for_wgn = abs(c_wg)

subplot(2,2,1), plot(t1,g,'b',t1,gn,'r')
title('Plot of g with Fourier Expansion g_n')
axis tight

subplot(2,2,2), plot(t1,wg,'b',t1,wgn,'r')
title('Plot of the Windowed g with Fourier Expansion wg_n')

subplot(2,2,3), stem(abs(c_g)),
title('Fourier Coefficient Magnitudes for g_n')
axis([0 n+1 0 1.8])

subplot(2,2,4), stem(abs(c_wg)),
axis([0 n+1 0 1.8])
title('Fourier Coefficient Magnitudes for wg_n')