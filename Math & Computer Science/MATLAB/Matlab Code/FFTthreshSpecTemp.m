function FFTthreshSpec = FFTthreshSpec(x,sr,N,r,ymax) 
global z PR CR 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This program uses wavwrite (near end of program) for MATLAB.%%%
%For FreeMat, this command should be changed to wavwrite2.%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%For this program, r is the desired percent reduction
%The FFT is performed on blocks of length N of x. 

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

%NB is the number of blocks of length N in x.
%TB is the time length of the blocks.

NB = L/N;  
TB = T/NB;

%The following items are initialized for subsequent use.
%They will be used to contsruct spectrogram matrices for 
%the FFT blocks.  

kmax = round(ymax*TB);

if ymax > sr
    kmax = N;
end   

ColumnCount = 0;
D1 = zeros(kmax,NB);
D2 = zeros(kmax,NB);

%The next loop computes the FFT transform blocks, and
%then thresholds the blocks. 

for B = 0:N:L-N;
   c(B+1:B+N) = (1/N)*fft(x(B+1:B+N));
   c_original(B+1:B+N) = c(B+1:B+N)';
   threshold(c(B+1:B+N),r)
   c(B+1:B+N) = z;
   ColumnCount = ColumnCount + 1;
   D1(1:kmax,ColumnCount) = abs(c_original(B+kmax:-1:B+1));
   D2(1:kmax,ColumnCount) = abs(z(kmax:-1:1))';
end

%This loop computes blocks of x using the IDCT II.
for B = 0:N:L-N;
   xm(B+1:B+N) = N*real(ifft(c(B+1:B+N)))';  
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
%To plot the spectrogram matrices D1 and D2, we will need 
%to set the scale for the tick marks on the axes. 
%The TimeTicks value corresponds to the number
%of time tick marks to put on the time axis.
%Similarly for the frequency (vertical) axis. 

TimeTicks = 5;
DeltaTmark = floor(ColumnCount/TimeTicks);
DeltaT = T/TimeTicks;

FreqTicks = 6;
DeltaFmark = ceil(kmax/FreqTicks);
DeltaF = round(1/TB*kmax/FreqTicks);
DeltaF = ceil(DeltaF/5)*5;  %Adjust to nearby multiple of 5
FreqMax = floor(kmax/TB);
FreqMax = ceil(FreqMax/5)*5; %Adjust to nearby multiple of 5


figure

subplot(2,2,1), timeplot(x_original,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal')

subplot(2,2,2), timeplot(xm,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Thresholded Signal')

subplot(2,2,3), imagesc(D1), colormap(jet),  
title('Original FFT Spectrogram'),
axis tight, xlabel('Time (sec)'), ylabel('Frequency (Hz)'),
set(gca,'XTick',0:DeltaTmark:ColumnCount)
set(gca,'XTickLabel',[0:DeltaT:T])
set(gca,'YTick',0:DeltaFmark:kmax)
set(gca,'YTickLabel',[FreqMax:-DeltaF:0])

subplot(2,2,4), imagesc(D2), colormap(jet), 
title('Thresholded FFT Spectrogram'),
axis tight, xlabel('Time (sec)'), ylabel('Frequency (Hz)'),
set(gca,'XTick',0:DeltaTmark:ColumnCount)
set(gca,'XTickLabel',[0:DeltaT:T])
set(gca,'YTick',0:DeltaFmark:kmax)
set(gca,'YTickLabel',[FreqMax:-DeltaF:0])

%The following command will write the
%compressed sound wave to the current
%work folder.

%The bit rate is set at 16, which is 
%commonly used for recording software.

%wavwrite2(xm,sr,16,'FFTthreshSpec.wav');
wavwrite(xm,sr,16,'FFTthreshSpec.wav');

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.

