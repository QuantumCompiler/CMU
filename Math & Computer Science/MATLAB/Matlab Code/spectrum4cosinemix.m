function fcnplot = fcnplot(freq1,freq2,freq3,freq4)

%This program computes Fourier coefficients of f,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 
    
N = 2^(10);
t = [0:1/N:4*(N-1/4)/N]';

%Enter the formulas for the function.

f(1:N) = cos(2*pi*freq1*t(1:N))+cos(2*pi*freq2*t(1:N));
f(N+1:2*N) = cos(2*pi*freq2*t(N+1:2*N))+cos(2*pi*freq3*t(N+1:2*N));
f(2*N+1:3*N) = cos(2*pi*freq3*t(2*N+1:3*N))+cos(2*pi*freq4*t(2*N+1:3*N));
f(3*N+1:4*N) = cos(2*pi*freq4*t(3*N+1:4*N));

%Compute the DFT values.

c = 1/(4*N)*fft(f);

%Prepare the DFT magnitudes for plotting.  
%The values for n, right, right2 and right8
%are based on viewing preferences.  

maxf = max([freq1,freq2,freq3,freq4]);
n = maxf;
right = n + 4;
right2 = 2*n;
right8 = 8*n;

cmag = abs(c(1:right8));

c1 = 1/N*fft(f(1:N));
c1mag = abs(c1(1:right))';

c2 = 1/N*fft(f(N+1:2*N));
c2mag = abs(c2(1:right))';

c3 = 1/N*fft(f(2*N+1:3*N));
c3mag = abs(c3(1:right))';

c4 = 1/N*fft(f(3*N+1:4*N));
c4mag = abs(c4(1:right))';

%Plot the time and frequency domain graphs. 

height = 1.2*max(cmag);
height1 = 1.2*max(c1mag);
height2 = 1.2*max(c2mag);
height3 = 1.2*max(c3mag);
height4 = 1.2*max(c4mag);

T = 1;

figure
subplot(1,2,1), plot(t,f,'b')
title('Time Domain Plot of f(t)')
axis auto

subplot(1,2,2),  stemTfft(cmag,4)
title('Frequency Domain Plot of f(t)')
axis([-0.5 right2  0 height])

figure
subplot(2,2,1), stemTfft(c1mag,T)
title('Frequency Domain Plot of f1(t)')
axis([-0.5 right 0 height1])

subplot(2,2,2),  stemTfft(c2mag,T)
title('Frequency Domain Plot of f2(t)')
axis([-0.5 right 0 height2])

subplot(2,2,3), stemTfft(c3mag,T)
title('Frequency Domain Plot of f3(t)')
axis([-0.5 right 0 height3])

subplot(2,2,4),  stemTfft(c4mag,T)
title('Frequency Domain Plot of f4(t)')
axis([-0.5 right 0 height4])

%Set up the spectrogram matrix and then plot it. 
%The tick label commands are intended to display
%the fft values according to frequency k/T. 

m = round(T*(n+3));
D = [c1mag(1:m),c2mag(1:m),c3mag(1:m),c4mag(1:m)]

figure
imagesc(D), colormap(gray), 
title('Spectrogram of f')
set(gca,'YTick',0:1:m)
set(gca,'YTickLabel',[-1/T:1/T:(1/T)*m])



