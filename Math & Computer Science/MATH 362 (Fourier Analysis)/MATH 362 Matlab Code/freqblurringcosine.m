function fcnplot = fcnplot(n,k,T)
    
%For this program, n is the order of the Fourier expansion g_n
%and k is the frequency of the actual sine wave, while T is the 
%window length for the sampled sine wave. 

%Determine sample nodes. 

N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';
t1 = [0:T/N:T*(N-1)/N]';
t2 = [0:T/N:(N-1)/N]';

%Enter the formulas for the functions.

f = cos(2*pi*k.*t);
f_T = cos(2*pi*k.*t1);

%Compute the Fourier coefficients for f with T = 1.

c = 1/N*fft(f);

%Compute the Fourier coefficients and expansion for f_T with T as specified.

c_T = 1/N*fft(f_T);
a_T = 2*real(c_T(2:M));
b_T = -2*imag(c_T(2:M));
a0_T = real(c_T(1));

g_n = a0_T;
for m = 1:n
    g_n = g_n + a_T(m)*cos(2*pi*m.*t2/T)+ b_T(m)*sin(2*pi*m.*t2/T);
end

%Plot the functions.

k1 = 2*k+1;
k2 = n+1;

subplot(2,2,1), plot(t,f,'b')
title('Time Domain Plot of f')
axis tight

subplot(2,2,2), plot(t2,g_n,'r')
title('Time Domain Plot of g_n')
axis tight

subplot(2,2,3), stemfft(abs(c(1:k1)),1),
title('Frequency Domain Plot of f')

subplot(2,2,4), stemfft(abs(c_T(1:k2)),T),
title('Frequency Domain Plot of g_n')