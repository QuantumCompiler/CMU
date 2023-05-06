%This script plots the function and its spectrogram.
    
%Determine sample nodes. 

N = 8;
tN = [0:1/N:(N-1)/N]';

M = 100;
t = [0:1/M:(M-1)/M]';

%Enter formulas for function on the M = 100 set of nodes. 

f1M = cos(2.*pi.*0.*t);
f2M = cos(2.*pi.*1.*t);
f3M = cos(2.*pi.*2.*t);
f4M = cos(2.*pi.*3.*t);

%Enter formulas for function on the N = 8 set of nodes. 

f1 = cos(2.*pi.*0.*tN);
f2 = cos(2.*pi.*1.*tN);
f3 = cos(2.*pi.*2.*tN);
f4 = cos(2.*pi.*3.*tN);

%Compute the FFT values; i.e.e, the Fourier coefficients)

c1 = 1/N*fft(f1);
c2 = 1/N*fft(f2);
c3 = 1/N*fft(f3);
c4 = 1/N*fft(f4);

%Compute the magnitudes of the non-aliased FFT values:

d1 = abs(c1(1:4));
d2 = abs(c2(1:4));
d3 = abs(c3(1:4));
d4 = abs(c4(1:4));

%Form the spectrogram matrix D using the vectors d_k as columns:

D = [d1,d2,d3,d4]

%Now plot the original funtion f along with the spectrogram matrix D 

figure
subplot(1,2,1), plot(t,f1M,'b',t+1,f2M,'r',t+2,f3M,'g',t+3,f4M,'k')
title('Plot of f(t)')
axis tight

subplot(1,2,2), imagesc(D), colormap(gray), axis image,
title('Spectrogram Plot')




