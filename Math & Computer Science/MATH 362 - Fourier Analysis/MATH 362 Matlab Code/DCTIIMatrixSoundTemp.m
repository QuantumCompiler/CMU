function DCTIImatrixsound = DCTIImatrixsound(x,sr,N,r,TZL,TZR) 
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
LdivN = L/N;

%This loop computes the DCT II and IDCT II transform matrices.
for i = 1:N
    for j = 1:N
        C(i,j) = cos(pi./N*(j-1/2)*(i-1));
    end
end
C(1,:) = sqrt(1/2)*C(1,:);
C = sqrt(2/N)*C;
CI = inv(C);


%The following items are initialized for subsequent use.
%They will be used to contsruct a spectrogram matrix for 
%the DCTII blocks.  

counter = 0;
D = zeros(N,LdivN);
D2 = zeros(N,LdivN);

%The next loop computes the DCT II transform blocks, and
%then thresholds the blocks. 

for B = 0:N:L-N;
   c2(B+1:B+N) = C*x(B+1:B+N);
   c2_original(B+1:B+N) = c2(B+1:B+N)';
   threshold(c2(B+1:B+N),r)
   c2(B+1:B+N) = z;
   counter = counter + 1;
   D(:,counter) = abs(c2_original(B+1:B+N));
   D2(:,counter) = abs(z)';
end

%This loop computes blocks of x using the IDCT II.
for B = 0:N:L-N;
   xm(B+1:B+N) = CI*c2(B+1:B+N)';
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

subplot(3,2,5), stem(abs(c2_original(1:4*N))), 
axis tight, xlabel('Vector Indices'),
title('Original DCT II Magnitudes (Partial)')

subplot(3,2,6), stem(abs(c2(1:4*N))),axis tight,
axis tight, xlabel('Vector Indices'),
title('Thresholded DCT II Magnitudes (Partial)')

%Next plot spectrograms of DCT II values for the 
%before and after results of thresholding. 

figure

subplot(1,2,1), imagesc(D), colormap(jet), axis image
title('Original DCT II Spectrogram')

subplot(1,2,2), imagesc(D2), colormap(jet), axis image
title('Thresholded DCT II Spectrogram')

%The following command will write the
%compressed sound wave to the current
%work folder.

%The bit rate is set at 16, which is 
%commonly used for recording software.

%wavwrite2(xm,sr,16,'mp3_soundfile.wav');
wavwrite(xm,sr,16,'DCTII_MatrixSound.wav');

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.

