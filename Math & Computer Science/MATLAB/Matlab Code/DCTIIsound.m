function DCTIIsound = DCTIIsound(x,sr,N,r,ymax) 
global z PR CR 

%For this program, r is the desired percent reduction.
%The DCT II is performed on blocks of length N of x. 
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
%They will be used to contsruct spectrogram matrices for 
%the DCTII blocks.  

%cos(Pi*k/T) -> freq = k/(2T) and k = freq*(2T)
kmax = round(ymax*(2*TB));  %kmax = column length of D and is < N/2

if ymax > sr/2
    kmax = floor(N/2);
end   

ColumnCount = 0;
D1 = zeros(kmax,NB);
D2 = zeros(kmax,NB);

%The next loop computes the DCT II transform blocks, and
%then thresholds the blocks. 

for B = 0:N:L-N;
   c2(B+1:B+N) = C*x(B+1:B+N);
   c2_original(B+1:B+N) = c2(B+1:B+N)';
   threshold(c2(B+1:B+N),r)
   c2(B+1:B+N) = z;
   ColumnCount = ColumnCount + 1;
   D1(1:kmax,ColumnCount) = abs(c2_original(B+kmax:-1:B+1));
   D2(1:kmax,ColumnCount) = abs(z(kmax:-1:1))';
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
%To plot the spectrogram matrices D1 and D2, we will need 
%to set the scale for the tick marks on the axes. 
%The TimeTicks value corresponds to the number
%of time tick marks to put on the time axis.
%Similarly for the frequency (vertical) axis. 

TimeTicks = 5;
DeltaTmark = floor(ColumnCount/TimeTicks);
DeltaT = T/TimeTicks;

%The frequency marks are calculated next.  
%Recall that the column length of D is kmax. 
%The k-th entry in columns has freq = k/TB. 

FreqTicks = 6;
DeltaFmark = ceil(kmax/FreqTicks);
DeltaF = round(1/(2*TB)*kmax/FreqTicks); %cos(Pi*k/T) -> freq = k/(2T)
%DeltaF = ceil(DeltaF/5)*5;  %Adjust to nearby multiple of 5
FreqMax = floor(kmax/(2*TB));
%FreqMax = ceil(FreqMax/5)*5; %Adjust to nearby multiple of 5
%FreqMax = FreqMax+DeltaF;  %Scaling adjustment for y-axis labels

figure

subplot(2,2,1), timeplot(x_original,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal')

subplot(2,2,2), timeplot(xm,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Thresholded Signal')

subplot(2,2,3), imagesc(D1), colormap(jet),  
title('Original DCT II Spectrogram'),
axis tight, xlabel('Time (sec)'), ylabel('Frequency (Hz)'),
set(gca,'XTick',0:DeltaTmark:ColumnCount)
set(gca,'XTickLabel',[0:DeltaT:T])
set(gca,'YTick',0:DeltaFmark:kmax)
set(gca,'YTickLabel',[FreqMax:-DeltaF:0])

subplot(2,2,4), imagesc(D2), colormap(jet), 
title('Thresholded DCT II Spectrogram'),
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

%wavwrite2(xm,sr,16,'DCTIIsound.wav');
audiowrite('DCTIIsound.wav',xm,sr);

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.

