function FFTsound = FFTsound(x)

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   

%Compute the fft of x. 

N = length(x);
c = (1/N)*fft(x);

%Report the dominant frequency results.

T = round(N/44100);

j = 20;
s = 8;
[max_c,max_k] = max(abs(c));
f(1) = max_k/T;
for k = 2:s
    [max_c,max_k] = max(abs(c(f(k-1)*T+j:N/2)));
    f(k) = (f(k-1)*T  + j + max_k)/T;
end

Dominant_frequencies =...
sprintf('A few dominant frequencies (in Hz) are listed below.')
freq = f'

%Plot the frequency domain graphs.

K = 500*T;

subplot(2,2,1), plot(x), axis tight
title('Time Domain Plot of Sound Wave')

subplot(2,2,2), plot(x(1:K)), axis tight
title('Time Domain Plot of Sound Wave (Partial)')

subplot(2,2,3), plotfft(abs(c(1:4*K)),T),
title('Frequency Domain Plot of Sound Wave (Partial)')

subplot(2,2,4), plotfft(abs(c(1:K)),T),
title('Frequency Domain Plot of Sound Wave(Partial)')

