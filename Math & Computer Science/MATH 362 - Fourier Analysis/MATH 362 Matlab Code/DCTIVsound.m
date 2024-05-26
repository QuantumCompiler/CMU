function DCTIVsound = DCTIVsound(x,r) 
   
  N = length(x); 
  
  y(1:8*N)=zeros(1,8*N); 
  
  y(2:2:2*N) = x(1:N);
  y(2*N+2:2:4*N) = -x(N:-1:1);  
  y(4*N+2:2:6*N) = -x(1:N);
  y(6*N+2:2:8*N) = x(N:-1:1);
  
  z = fft(y');
  c4fft = (1/4)*sqrt(2/N)*real(z(2:2:2*N))
  stem(abs(c4fft))
  
%Report the results and output from threshold program:

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Now graph the original and compressed
%files side-by-side for comparison.

subplot(3,2,1), plot(x_original),
title('Original Vector')

subplot(3,2,2), plot(x_original(1:600)),
title('Original Vector (Partial)')

subplot(3,2,3), plot(xmw),
title('MP3 Compressed Vector')

subplot(3,2,4), plot(xmw(1:600)),
title('MP3 Compressed Vector (Partial)')

subplot(3,2,5), stem(abs(cm_original(1:600))),
title('Original MDCT Magnitudes (Partial)')

subplot(3,2,6), stem(abs(cm(1:600))),
title('Thresholded MDCT Magnitudes (Partial)')


%The following command will write the
%compressed sound wave to the current
%work folder.

%The sample and bit rates are set at
%default values of 44100 and 16.

%wavwrite2(xmw,44100,16,'mp3_soundfile.wav');
wavwrite2(xmw,44100,16,'mp3_aah_60%.wav');

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.