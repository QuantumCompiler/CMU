function BandPassFreq = BandPassFreq(soundfile,f1,f2,L,R)

%The parameters f1 and f2 are the left and right endpoints of the
%frequency band to keep, as referenced by the frequency index.  
%The parameters L and R determine the plot windows (see end of program). 

%We first find the FFT of the sound vector:

c = fft(soundfile);


%The following definitions convert the desired frequency bands
%to vector index values k (recall that freq = k/T). 

sample_rate = 44100;
N = length(soundfile);
T = N/sample_rate;
a = round(f1*T);
b = round(f2*T);

%The following loops filters the fft vector c, which we will rename fc.   

fc = c;
for k = 1:a
   fc(k) = 0;
end

for k = b:N
   fc(k) = 0;
end

%The inverse FFT (IFFT) returns a vector with complex values, 
%due to the loss of original FFT values when bandpassing.  
%We will make use of only the real part of the IFFT. 
%The command below returns the filtered soundwave fs.  

fs = real(ifft(fc));

%Now graph original and filtered FFT graphs side-by-side for comparison.

figure
subplot(1,2,1), plotfft(abs(c(L:R)),T),
title('Original FFT Magnitudes (Partial)')

subplot(1,2,2), plotfft(abs(fc(L:R)),T),
title('Bandpassed FFT Magnitudes (Partial)')

%The following command will write the filtered sound wave to the current work folder. 
%The sample and bit rates are set at 44100 and 16, but can be changed as needed.  

wavwrite(fs,sample_rate,16,'bandpass_soundwave.wav'); 
