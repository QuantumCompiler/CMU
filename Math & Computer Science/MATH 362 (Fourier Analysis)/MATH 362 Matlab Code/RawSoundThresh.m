function RawSoundThresh = RawSoundThresh(x,sr,r,TZL,TZR)
global z PR CR 

%This program thresholds x at percent level r. 
%It then plots time domain graphs.  
%sr is the sample rate, TZL and TZR are the
%time zoom left and time zoom right endpoints
%for the zoomed in time domain plot.  

%This program works on large vectors.  We'll time it using the 
%tic command (start clock) and the toc command (stop clock).

tic;

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end 

%Compute necessary parameters.

N = length(x);

%Threshold x at r percent. 

c = x;
threshold(c,r)
xt = z;

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

subplot(2,2,1), timeplot(x,1,N,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Original')
%title('Time Domain Plot of Original Signal')

subplot(2,2,2), timeplot(xt,1,N,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Thresholded')
%title('Time Domain Plot of Thresholded Signal')

subplot(2,2,3), timeplot(x,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Original(Partial)')
%title('Time Domain Plot of Original Signal (Partial)')

subplot(2,2,4), timeplot(xt,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Thresholded (Partial)')
%title('Time Domain Plot of Thresholded Signal (Partial)')

%figure
%timeplot(x,KTL,KTR,sr), 
%axis tight


%The following command will write the
%compressed sound wave to the current
%work folder.

%The sample and bit rates are set at
%default values of 44100 and 16.

%FreeMat:
%wavwrite2(xt,44100,16,'raw_thresh.wav.wav');

%Old MATLAB
%wavwrite(xt,44100,16,'raw_thresh.wav.wav');

%MATLAB
audiowrite('raw_thresh.wav',xt,sr);

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