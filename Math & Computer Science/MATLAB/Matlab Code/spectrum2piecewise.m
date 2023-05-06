function fcnplot = fcnplot(freq1,freq2)

%This program computes Fourier coefficients of f,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
M = N/2;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function.

f1(1:M) = sin(2*pi*freq1*t(1:M));
f2(1:M) = sin(2*pi*freq2*t(1:M));
f = [f1,f2]';

%Compute the Fourier coefficients and magnitudes.

c = 1/N*fft(f);

maxf = max(freq1,freq2);
n = 2*maxf;

cmag = abs(c(1:n));

c1 = 1/M*fft(f1);
c1mag = abs(c1(1:n))';

c2 = 1/M*fft(f2);
c2mag = abs(c2(1:n))';

%Plot the time and frequency domain graphs. 

height = 1.2*max(cmag);
right = n;

figure
subplot(2,2,1), plot(t,f,'b')
title('Time Domain Plot of f(t)')
axis auto

subplot(2,2,2),  stem(cmag)
title('Frequency Domain Plot of f(t)')
axis([-0.5 right 0 height])

subplot(2,2,3), stemTfft(c1mag,0.5)
title('Frequency Domain Plot of f1(t)')

subplot(2,2,4),  stemTfft(c2mag,0.5)
title('Frequency Domain Plot of f2(t)')

%Set up the spectrogram matrix and then plot it. 
%The tick label commands are designed to display
%the fft values according to frequency k/T. 


D = [c1mag(1:maxf),c2mag(1:maxf)]
T = 1/2;

figure
imagesc(D), colormap(gray), axis image
title('Spectrogram of f')
set(gca,'YTick',0:1:maxf)
set(gca,'YTickLabel',[-1/T:1/T:(1/T)*maxf])



