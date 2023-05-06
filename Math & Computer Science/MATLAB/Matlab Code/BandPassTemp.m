function BP = BP(x,sr,domfreq,BandL,BandR,PlotL,PlotR)

%Here domfreq is the dominant (whole number) frequency in center of band.  
%BandL and BandR are whole number left and right endpoints,respectively, 
%of frequency band to keep when doing the bandpassing.  
%PlotL and PlotR are whole number frequencies that indicate 
%the left and right endpoints of frequency domain plots. 

%We first find the FFT of the sound vector:

N = length(x);
c = 1/N*fft(x);

%The following definitions convert the desired frequency bands
%to vector index values k (recall that freq = k/T). 

T = round(N/sr);
a = round(BandL*T);
b = round(BandR*T);

%The following loops filters the fft vector c, which we will rename fc.
%Because of symmetry due to aliasing of FFT values about N/2, 
%we filter as follows. 

fc = c;
for k = 1:a
   fc(k) = 0;
end

for k = b:N - b
   fc(k) = 0;
end

for k = N - a:N
   fc(k) = 0;
end


%The inverse FFT returns a vector with negligible complex values, 
%for our fc vector, due to loss of FFT values when bandpassing.  
%We will make use of only the real part of the IFFT. 
%The command below returns the filtered soundwave fs.  

fs = N*real(ifft(fc));

%Now graph original and filtered graphs side-by-side for comparison.

cycles = 4;
TimeLength = cycles/domfreq;
IndexLength = round(TimeLength*sr);

KFL = max(1,round(PlotL*T));
KFR = round(PlotR*T);

figure
subplot(2,2,1), freqstem(c,KFL,KFR,T),
axis tight, xlabel('Frequency (Hz)'),
title('Original FFT Magnitudes (Partial)')

subplot(2,2,2), freqstem(fc,KFL,KFR,T),
axis tight, xlabel('Frequency (Hz)'),
title('Bandpassed FFT Magnitudes (Partial)')

subplot(2,2,3), timeplot(x,1,IndexLength,sr), 
axis tight, xlabel('Time (sec)'),
title('Original Sound Wave (Partial)')

subplot(2,2,4), timeplot(fs,1,IndexLength,sr), 
axis tight, xlabel('Time (sec)'),
title('Bandpassed Sound Wave (Partial)')

%Next graph partial time domain plot of bandpassed wave so that
%we can check for accuracy.  The observed frequency should match
%the expected frequency.  To compute the observed frequency, count
%the number of observed cycles and divide by the time length reported
%in the plot window. 

figure
timeplot(fs,1,IndexLength,sr), axis tight, xlabel('Time (sec)'),
title(sprintf('Length of time interval is %f sec',TimeLength))


%The following command will write the filtered sound wave to the current work folder. 
%The sample and bit rates are set at 44100 and 16, but can be changed as needed.  

wavwrite(fs,sr,16,'bandpass_soundwave.wav'); 
