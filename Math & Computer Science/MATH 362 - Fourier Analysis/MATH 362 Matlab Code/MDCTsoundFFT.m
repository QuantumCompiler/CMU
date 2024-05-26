function MDCTsound = MDCTsound(x,sr,N,r,ymax) 
global z PR CR 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This program uses wavwrite (near end of program) for MATLAB.%%%
%For FreeMat, this command should be changed to wavwrite2.%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This program takes awhile to run.  We'll time it using the 
%tic command (start clock) and the toc command (stop clock)!

tic;

%For this program, r is the desired percent reduction.
%The block size is set at the beginning of the program.
%Normally N is taken to be 6 (short block) or 18 (long block). 

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x;

%We pad x so that its length is a multiple of M = 2N.
M = 2*N;
L1 = length(x);
LM = L1/M;
CLM = ceil(LM);
LMdiff = M*(CLM - LM);
LMpad = x(L1)*ones(LMdiff,1);
x = [x;LMpad];
L = length(x);
LdivN = (L/N) + 1;

%Zero-pad x front and back, for use with IMDCT and TDAC.
zpad = zeros(N,1);
x = [zpad;x;zpad];
Lz = length(x);
m=[1:1:M]';
w = sqrt(2)*sin(pi./M*(m-0.5));

%This loop computes the MDCT transform blocks using the fft.
for B = 0:N:Lz-M;
   a = w(1:M).*x(B+1:B+M);
   b(1:N/2) = -a(3*N/2:-1:N+1) - a(3*N/2+1:2*N);
   b(N/2+1:N) = a(1:N/2) - a(N:-1:N/2+1);
   c(1:8*N)=zeros(1,8*N);
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = -b(N:-1:1);  
   c(4*N+2:2:6*N) = -b(1:N);
   c(6*N+2:2:8*N) = b(N:-1:1);
   cfft = fft(c');
   cmfft = (1/4)*sqrt(1/N)*real(cfft(2:2:2*N));
   cm(B+1:B+N) = cmfft(1:N);
end

%Here we call the thresholding program.
cm_original = cm';
threshold(cm,r)
cm = z;

%This loop computes blocks of x using the IMDCT, TDAC and fft.
ym(1:M) = zeros(M,1);
for B = 0:N:Lz-M;
   b = cm(B+1:B+N);
   c(1:8*N)=zeros(1,8*N); 
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = -b(N:-1:1);  
   c(4*N+2:2:6*N) = -b(1:N);
   c(6*N+2:2:8*N) = b(N:-1:1);
   cfft = fft(c');
   y = (1/4)*sqrt(1/N)*real(cfft(2+N:2:5*N));
   y = w(1:M).*y(1:M);
   xmw(B+1:B+N) = y(1:N)+ym(N+1:M)';
   ym = y';
end

xmw = xmw(N+1:N+L1)';

%Report the results and output from threshold program:

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Compute the threshholding run time.

decimal_min_1 = toc/60;
minute_1 = floor(decimal_min_1);
second_1 = 60*(decimal_min_1 - minute_1);
Run_Time_Compression = ...
sprintf('The thresholding run time was %d minutes and %d seconds.',minute_1, second_1)

tic;

%Now graph the original and compressed
%files side-by-side for comparison.

subplot(3,2,1), plot(x_original), axis tight
title('Original Vector')

subplot(3,2,2), plot(x_original(1:600)), axis tight
title('Original Vector (Partial)')

subplot(3,2,3), plot(xmw), axis tight
title('MP3 Compressed Vector')

subplot(3,2,4), plot(xmw(1:600)), axis tight
title('MP3 Compressed Vector (Partial)')

subplot(3,2,5), stem(abs(cm_original(1:600)))
title('Original MDCT Magnitudes (Partial)')

subplot(3,2,6), stem(abs(cm(1:600)))
title('Thresholded MDCT Magnitudes (Partial)')


%The following command will write the
%compressed sound wave to the current
%work folder.

%The sample and bit rates are set at
%default values of 44100 and 16.

%wavwrite2(xmw,44100,16,'mp3_soundfile.wav');
wavwrite2(xmw,44100,16,'mp3_aah_90%.wav');

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.

%Compute the next run time. 

decimal_min_2 = toc/60;
minute_2 = floor(decimal_min_2);
second_2 = 60*(decimal_min_2 - minute_2);
Run_Time_Plot = ...
sprintf('The plotting and wavwrite run time was %d minutes and %d seconds.',minute_2, second_2)

