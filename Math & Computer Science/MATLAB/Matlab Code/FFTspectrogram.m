function FFTspectrogram = FFTspectrogram(x,sr,N,ymax) 

%The FFT is performed on blocks of length N of x. 
%Also, ymax is the max desired frequency to display. 

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
%They will be used to construct spectrogram matrices for 
%the FFT blocks.  

kmax = round(ymax*TB);

if ymax > sr
    kmax = N;
end   

ColumnCount = 0;
D = zeros(kmax,NB);

%The next loop computes the FFT transform blocks, and
%then thresholds the blocks. 

for B = 0:N:L-N;
   c(B+1:B+N) = (1/N)*fft(x(B+1:B+N));
   ColumnCount = ColumnCount + 1;
   D(1:kmax,ColumnCount) = abs(c(B+kmax:-1:B+1));
end

%To plot the spectrogram matrix D, we will need 
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
FreqMax = FreqMax+DeltaF;  %Scaling adjustment for y-axis labels

figure

subplot(2,1,1), timeplot(x_original,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal')

subplot(2,1,2), imagesc(D), colormap(jet),  
title('Original FFT Spectrogram'),
axis tight, xlabel('Time (sec)'), ylabel('Frequency (Hz)'),
set(gca,'XTick',0:DeltaTmark:ColumnCount)
set(gca,'XTickLabel',[0:DeltaT:T])
set(gca,'YTick',0:DeltaFmark:kmax)
set(gca,'YTickLabel',round(1/T*[FreqMax:-DeltaF:0]))


