function fcnplot = fcnplot(T,freq1,freq2)

%This program plots the time and frequency domain plot
%for a musical chord f with frequencies m1, m2, m3,
%as specifed below, and sample interval length T, 
%where T << 1 and T is close in value to the period of f.  
   
%T = 0.03, 0.012, 0.01, etc, are good choices for the
%frequencies given below. 
    
%Determine sample nodes. 

N = 4000;
M = N/2;
t = [0:1/N:(N-1)/N]';
t1 = [0:T/N:T*(N-1)/N]';

%Enter the formulas for the functions.

freq = [freq1,freq2];
coeff = [1,1,1];
Lf = length(freq);

f = 0;
for k = 1:Lf 
    f = f + coeff(k)*sin(2*pi*freq(k)*t);
end

f_T = 0;
for k = 1:Lf 
    f_T = f_T + coeff(k)*sin(2*pi*freq(k)*t1);
end

%Compute the Fourier coefficients for f with T = 1.

c = 1/N*fft(f);

%Compute the Fourier coefficients for f_T with T as specified.

c_T = 1/N*fft(f_T);

%Plot the functions.

k1 = 1.1*freq(2);
k2 = 1.5*round(freq(2)*T);

subplot(2,2,1), plot(t,f,'b')
title('Time Domain Plot of f')
axis tight

subplot(2,2,2), plot(t1,f_T,'r')
title('Time Domain Plot of f_T')
axis tight

subplot(2,2,3), plotfft(2*abs(c(1:k1)),1),
title('Frequency Domain Plot of f')

subplot(2,2,4), stemfft(2*abs(c_T(1:k2)),T),
title('Frequency Domain Plot of f_T')