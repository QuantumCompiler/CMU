function fcnplot = fcnplot(T)

%This program plots the time and frequency domain plot
%for a musical chord f with frequencies m1, m2, m3,
%as specifed below, and sample interval length T, 
%where T << 1 and slightly different than the value 
%for the period of f.   

%Determine sample nodes. 

N = 4000;
M = N/2;
t = [0:1/N:(N-1)/N]';
t1 = [0:T/N:T*(N-1)/N]';
t2 = [0:T/N:(N-1)/N]';

%Enter the formulas for the function. 

freq = [220,440,880];
coeff = [1,2,3];
Lf = length(freq);

f = 0;
for k = 1:Lf 
    f = f + coeff(k)*sin(2*pi*freq(k)*t);
end

f_T = 0;
for k = 1:Lf 
    f_T = f_T + coeff(k)*sin(2*pi*freq(k)*t1);
end

%Compute the Fourier coefficients.

c = 1/N*fft(f);

%Plot the functions.

k = round(1.1*m3)

subplot(1,2,1), plot(t,f,'b')
title('Plot of f with Fourier Expansion g')
axis tight

subplot(1,2,2), plotfft(2*abs(c(1:k)),T),
title('Frequency Domain Plot of g')