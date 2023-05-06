function fcnplot = fcnplot(freq1,freq2)

%This program computes Fourier coefficients of f,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
t = [0:1/N:2*(N-1/2)/N]';

%Enter the formulas for the function.

f(1:N) = sin(2*pi*freq1*t(1:N));
f(N+1:2*N) = sin(2*pi*freq2*t(N+1:2*N));

%Compute the DFT values.

c = 1/(2*N)*fft(f);

%Prepare the DFT magnitudes for plotting.  
%The values for n, right, right2, right4  
%are based on viewing preferences.  

maxf = max(freq1,freq2);
n = maxf;
right = n + 4;
right2 = 2*n;
right4 = 4*n;

cmag = abs(c(1:right4));

c1 = 1/N*fft(f(1:N));
c1mag = abs(c1(1:right))';

c2 = 1/N*fft(f(N+1:2*N));
c2mag = abs(c2(1:right))';

%Plot the time and frequency domain graphs. 

height = 1.2*max(cmag);
height1 = 1.2*max(c1mag);
height2 = 1.2*max(c2mag);

T = 1;

figure
subplot(2,2,1), plot(t,f,'b')
title('Time Domain Plot of f(t)')
axis auto

subplot(2,2,2),  stemTfft(cmag,2)
title('Frequency Domain Plot of f(t)')
axis([-0.5 right2 0 height])

subplot(2,2,3), stemTfft(c1mag,T)
title('Frequency Domain Plot of f1(t)')
axis([-0.5 right 0 height1])

subplot(2,2,4),  stemTfft(c2mag,T)
title('Frequency Domain Plot of f2(t)')
axis([-0.5 right 0 height2])

%Set up the spectrogram matrix and then plot it. 
%The tick label commands are intended to display
%the fft values according to frequency k/T. 

m = round(T*(n+3));
D = [c1mag(1:m),c2mag(1:m)]

figure
imagesc(D), colormap(gray), 
title('Spectrogram of f')
set(gca,'YTick',0:1:m)
set(gca,'YTickLabel',[-1/T:1/T:(1/T)*m])



