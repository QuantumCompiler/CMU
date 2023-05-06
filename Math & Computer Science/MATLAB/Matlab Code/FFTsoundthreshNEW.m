function FFTsoundthresh = FFTsoundthresh(x,r,TZL,TZR,FZL,FZR)
global z PR CR 

%This program plots time and frequency domain graphs
%for a sound wave.  The TZL and TZR parameters are the
%time zoom left and time zoom right endpoints
%for the zoomed in time domain plot.  
%The FZL and FZR parameters are the frequency zoom left
%and frequency zoom right endpoints.  They are entered
%as frequencies, for ex, as 1 and 500.  

%This program works on large vectors.  We'll time it using the 
%tic command (start clock) and the toc command (stop clock).

tic;

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end 

%Specify and compute necessary parameters.

sr = 44100;
N = length(x);
T = round(N/sr);

%Compute the fft of x and threshold at r percent. 

N = length(x);
c = (1/N)*fft(x);
threshold(c,r)
ct = z;

%The inverse FFT (IFFT) returns a
%vector with complex values, where the
%imaginary parts are all neglibable in our case.

xt = N*real(ifft(ct));

%Report the dominant frequency results.

[max_c,max_k] = max(abs(c));
dominant_freq = max_k/T;

Dominant_frequency = ...
sprintf('The dominant frequency is %d Hz.',dominant_freq)

%Report the thresholding results.

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Now graph the original and compressed
%files side-by-side for comparison.

KTL = max(1,round(TZL*sr));
KTR = round(TZR*sr);
KFL =  max(1,FZL*T);
KFR = FZR*T;

subplot(3,2,1), timeplot(x,1,N,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal')

subplot(3,2,2), timeplot(x,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal (Partial)')

subplot(3,2,3), timeplot(xt,1,N,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Thresholded Signal')

subplot(3,2,4), timeplot(xt,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Thresholded Signal (Partial)')

subplot(3,2,5), freqstem(c,KFL,KFR,T), 
axis tight, xlabel('Frequency (Hz)'),
title('Original FFT Magnitudes (Partial)')

subplot(3,2,6), freqstem(ct,KFL,KFR,T),axis tight,
axis tight, xlabel('Frequency (Hz)'),
title('Thresholded FFT Magnitudes (Partial)')

%The following command will write the
%compressed sound wave to the current
%work folder.

%The sample and bit rates are set at
%default values of 44100 and 16.

%wavwrite2(xmw,44100,16,'fourierthresh_soundfile.wav');
wavwrite(xt,44100,16,'fourier_aah_90%.wav');

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.

%Compute the run time. 

decimal_min = toc/60;
minute = floor(decimal_min);
second = 60*(decimal_min - minute);
Run_Time = ...
sprintf('The run time was %d minutes and %d seconds.',minute, second)