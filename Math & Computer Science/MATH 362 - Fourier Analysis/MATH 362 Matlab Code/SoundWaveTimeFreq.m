function FFTsound = FFTsound(x,sr,TZL,TZR,FZL,FZR)

%This program plots time and frequency domain graphs
%for a sound wave x recorded with sample rate sr.  
%The TZL and TZR parameters are the
%time zoom left and time zoom right endpoints
%for the zoomed in time domain plot.  
%The FZL and FZR parameters are the frequency zoom left
%and frequency zoom right endpoints.  They are entered
%as frequencies, for ex, as 1 and 500.  

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   

%Compute necessary parameters.

N = length(x);
T = round(N/sr);

%Compute the fft of x. 

N = length(x);
c = (1/N)*fft(x);

%Report the dominant frequency results (incomplete listing).

%%j = 20;
%%s = 8;
%%[max_c,max_k] = max(abs(c));
%%f(1) = max_k/T;
%%for k = 2:s
%%    [max_c,max_k] = max(abs(c(f(k-1)*T+j:N/2)));
%%    f(k) = (f(k-1)*T  + j + max_k)/T;
%%end

%%Dominant_frequencies =...
%%sprintf('A few dominant frequencies (in Hz) are listed below.')
%%freq = f'

%The following commands set up the parameters
%for the time and frequency domain graphs.

KTL = round(TZL*sr);
KTR = round(TZR*sr);
KFL =  max(1,FZL*T);
KFR = FZR*T;
right = 2000*T;

%Plot the frequency domain graphs.

subplot(2,2,1), timeplot(x,1,N,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot')

subplot(2,2,2), timeplot(x,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot(Partial)')

subplot(2,2,3), plotfft(abs(c(1:right)),T), 
axis tight, xlabel('Frequency (Hz)'),
title('Frequency Domain Plot')

subplot(2,2,4), freqstem(c,KFL,KFR,T),axis tight,
axis tight, xlabel('Frequency (Hz)'),
title('Frequency Domain Plot(Partial)')

figure
timeplot(x,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot(Partial)')

figure
plotfft(abs(c(1:right)),T), 
axis tight, xlabel('Frequency (Hz)'),
title('Frequency Domain Plot')


