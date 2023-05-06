function DCTIIthreshSound = DCTIIthreshSound(x,sr,N,r,TZL,TZR,FZL,FZR)
global z PR CR 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This program uses wavwrite (near end of program) for MATLAB.%%%
%For FreeMat, this command should be changed to wavwrite2.%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%For this program, r is the desired percent reduction
%The DCT II is performed on blocks of length N of x. 

%First we make sure the input vector is vertical.
 
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x;

%We pad x so that its length is a multiple of N.

L1 = length(x_original);
LN = L1/N;
CLN = ceil(LN);
LNdiff = N*(CLN - LN);
LNpad = x(L1)*ones(LNdiff,1);
x = [x;LNpad];

%Compute necessary parameters.

L = length(x);
T = round(L/sr);

%This loop computes the DCT II and IDCT II transform matrices.
for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1));
    end
end
C(1,:) = sqrt(1/2)*C(1,:);
C = sqrt(2/N)*C;
CI = inv(C);

%This loop computes the DCT II transform blocks using the fft.
for B = 0:N:L-N;
   b = x(B+1:B+N);
   c(1:4*N)=zeros(1,4*N);
   c(2:2:2*N) = b(1:N);
   c(2*N+2:2:4*N) = b(N:-1:1);  
   c = fft(c');
   c = (1/2)*sqrt(1/N)*real(c(2:2:2*N));
   c(1) = c(1)/sqrt(2);
   c2(B+1:B+N) = c;
end

%Here we call the thresholding program.
c2_original = c2';
threshold(c2,r)
c2 = z;

%This loop computes blocks of x using the IDCT II.
for B = 0:N:L-N;
   xm(B+1:B+N) = CI*c2(B+1:B+N);
end

%Restrict x back to its original (non-padded) length. 

xm = xm(1:L1);

%Report the results and output from threshold program:

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

subplot(3,2,1), timeplot(x_original,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal')

subplot(3,2,2), timeplot(x_original,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal (Partial)')


subplot(3,2,3), timeplot(xm,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Thresholded Signal')

subplot(3,2,4), timeplot(xm,KTL,KTR,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Thresholded Signal (Partial)')

subplot(3,2,5), freqstem(c2_original,KFL,KFR,T), 
axis tight, xlabel('Frequency (Hz)'),
title('Original DCT II Magnitudes (Partial)')

subplot(3,2,6), freqstem(c2,KFL,KFR,T),axis tight,
axis tight, xlabel('Frequency (Hz)'),
title('Thresholded DCT II Magnitudes (Partial)')


%The following command will write the
%compressed sound wave to the current
%work folder.

%The bit rate is set at 16, which is 
%commonly used for recording software.

%wavwrite2(xm,sr,16,'mp3_soundfile.wav');
wavwrite(xm,sr,16,'DCTII_ThreshSound.wav');

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.

