function fcnplot = fcnplot(freq1,freq2,freq3,freq4)

%This program computes Fourier coefficients of f,
%and plots the time and frequency domain graphs. 

%Determine sample nodes. 

T = 1/4;

N = 2^(11);
M = T*N;
t = [0:1/N:(N-1)/N]';

%Enter the formulas for the function.

f1(1:M) = cos(2*pi*freq1*t(1:M));
f2(1:M) = cos(2*pi*freq2*t(1:M));
f3(1:M) = cos(2*pi*freq3*t(1:M));
f4(1:M) = cos(2*pi*freq4*t(1:M));
f = [f1,f2,f3,f4]';

%Compute the DFT values.

c = 1/N*fft(f);

%Prepare the DFT magnitudes for plotting.  
%The values for n, right and right2 are  
%based on viewing preferences.  

maxf = max([freq1,freq2,freq3,freq4]);
n = maxf;
right = n + 4;
right2 = 2*n;

cmag = abs(c(1:right2));

c1 = 1/M*fft(f1);
c1mag = abs(c1(1:right))';

c2 = 1/M*fft(f2);
c2mag = abs(c2(1:right))';

c3 = 1/M*fft(f3);
c3mag = abs(c3(1:right))';

c4 = 1/M*fft(f4);
c4mag = abs(c4(1:right))';

%Plot the time and frequency domain graphs. 

height = 1.2*max(cmag);
height1 = 1.2*max(c1mag);
height2 = 1.2*max(c2mag);
height3 = 1.2*max(c3mag);
height4 = 1.2*max(c4mag);

figure
subplot(3,2,1), plot(t,f,'b')
title('Time Domain Plot of f(t)')
axis auto

subplot(3,2,2),  stemTfft(cmag,1)
title('Frequency Domain Plot of f(t)')
axis([-0.5 right2  0 height])

subplot(3,2,3), stemTfft(c1mag,T)
title('Frequency Domain Plot of f1(t)')
axis([-0.5 right 0 height1])

subplot(3,2,4),  stemTfft(c2mag,T)
title('Frequency Domain Plot of f2(t)')
axis([-0.5 right 0 height2])

subplot(3,2,5), stemTfft(c3mag,T)
title('Frequency Domain Plot of f3(t)')
axis([-0.5 right 0 height3])

subplot(3,2,6),  stemTfft(c4mag,T)
title('Frequency Domain Plot of f4(t)')
axis([-0.5 right 0 height4])

%Set up the spectrogram matrix and then plot it. 
%The tick label commands are intended to display
%the fft values according to frequency k/T. 

m = round(T*(n+6));
D = [c1mag(1:m),c2mag(1:m),c3mag(1:m),c4mag(1:m)];

figure
imagesc(D), colormap(gray), axis image
title('Spectrogram of f')
set(gca,'YTick',0:1:m)
set(gca,'YTickLabel',[-1/T:1/T:(1/T)*m])




