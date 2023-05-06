function MDCTsound = MDCTsound(x,sr,N,r,ymax) 
global z PR CR 

%For this program, r is the desired percent reduction.
%The block size is set at the beginning of the program.
%Normally N is taken to be 6 (short block) or 18 (long block). 
%Also, ymax is the max desired frequency to display. 

%First we make sure the input vector is vertical.

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   
x_original = x;

%We pad x so that its length is a multiple of M = 2N.
M = 2*N;
L1 = length(x_original);
LM = L1/M;
CLM = ceil(LM);
LMdiff = floor(M*(CLM - LM));
LMpad = x(L1)*ones(LMdiff,1);
x = [x;LMpad];

%Compute necessary parameters.

L = length(x);
T = round(L/sr);

%LdivN is the number of overlapping blocks in x.
%TB is the time length of the blocks.

LdivN = (L/N) + 1;
TB = T/LdivN;

%Zero-pad x front and back, for use with IMDCT and TDAC.
zpad = zeros(N,1);
xz = [zpad;x;zpad];
Lz = length(xz);
m=[1:1:M]';
w = sqrt(2)*sin(pi./M*(m-0.5));

%This loop computes the MDCT and IMDCT transform matrices.
for i = 1:N
    for j = 1:M
        C(i,j) = cos(pi./N*(j-1/2+N/2)*(i-1/2));
    end
end
C = sqrt(1/N)*C;

%The inverse of C is C^T: 

CI = C';

%Compute the block vectors xb and the
%windowed block vectors xbw of xz, and 
%store them as columns of XB and XBW. 

XB = zeros(M,LdivN);
XBW = zeros(M,LdivN);

B = 1;

for k = 1:LdivN
    XB(:,k) =  xz(B:B+M-1);
    XBW(:,k) =  w(1:M).*xz(B:B+M-1);
    B = B + N;
end

%Perform MDCT on windowed block vectors xbw 
%by multiplying the matrix C into the matrix XB,
%and store results as columns of matrix CB. 

CB = C*XBW;

%Compute the concatenated MDCT vector c,
%and then call the thresholding program.
%The thresholded concatenated vector is ct.

c = CB(:,1);

for k = 2:LdivN
   c = [c;CB(:,k)];
end
c_mag = abs(c);

threshold(c,r)
ct = z;
ct_mag = abs(ct);

%Unconcatenate ct to obtain thresholded block 
%vectors cbt, and store as columns of matrix CBT. 

CBT = zeros(N,LdivN);
B = 1;

for k = 1:LdivN
    CBT(:,k) =  ct(B:B+N-1);
    B = B + N;
end

%Use C^T to find the IMDCT block vectors yb by 
%multiplying the matrix C^T into the matrix CBT,
%and store results as columns of the matrix YB. 

YB = CI*CBT;

%Window the block vectors yb to get resulting  
%vectors ybw, and store as columns of YBW.

YBW = zeros(M,LdivN);

for k = 1:LdivN
    YBW(1:M,k) =   w(1:M).*YB(1:M,k);
end

%Construct the thresholded xzt using the IMDCT and TDAC.
%The temporary column vector y is updated in the loop at
%each iteration in order to perform the TDAC steps. 

y(1:M,1) = zeros(M,1);
B = 0;

for k = 1:LdivN;
   xzt(B+1:B+N) = YBW(1:N,k)+y(N+1:M);
   y = YBW(1:M,k);
   B = B + N;
end

%The vector xt is extracted from the nonpadded
%middle part of xzt. Also, recall that L1 is the
%length of the original vector x. 

xt = xzt(N+1:N+L1)';

%Report the results and output from threshold program:

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

%Set up the spectrogram matrices D1 and D2.  
%D1 is the before-thresholding MDCT matrix.
%D2 is the after-thresholding MDCT matrix. 
%Columns have frequencies in descending order.

%cos(Pi*k/T) -> freq = k/(2T) and k = freq*(2T)
kmax = round(ymax*(2*TB));  %kmax = column length of D and is < N/2

if ymax > sr/2
    kmax = floor(N/2);
end  

if kmax < 4
    kmax = 4;
end   

D1 = abs(CB(kmax:-1:1,:));
D2 = abs(CBT(kmax:-1:1,:));

%Now graph the original and compressed
%files side-by-side for comparison.
%to set the scale for the tick marks on the axes. 
%The TimeTicks value corresponds to the number
%of time tick marks to put on the time axis.
%Similarly for the frequency (vertical) axis. 

TimeTicks = 5;
DeltaTmark = floor(LdivN/TimeTicks);
DeltaT = T/TimeTicks;

%The frequency marks are calculated next.  
%Recall that the column length of D is kmax. 
%The k-th entry in columns has freq = k/TB. 

FreqTicks = 6; 
DeltaFmark = ceil(kmax/FreqTicks);
DeltaF = round(1/(2*TB)*kmax/FreqTicks);  %cos(Pi*k/T) -> freq = k/(2T)
%DeltaF = ceil(DeltaF/5)*5; %Adjust to nearby multiple of 5
FreqMax = floor(kmax/(2*TB));
%FreqMax = ceil(FreqMax/5)*5; %Adjust to nearby multiple of 5
%FreqMax = FreqMax+DeltaF;  %Scaling adjustment for y-axis labels

figure

subplot(2,2,1), timeplot(x_original,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Original Signal')

subplot(2,2,2), timeplot(xt,1,L1,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Thresholded Signal')

subplot(2,2,3), imagesc(D1), colormap(jet),  
title('Original MDCT Spectrogram'),
axis tight, xlabel('Time (sec)'), ylabel('Frequency (Hz)'),
set(gca,'XTick',0:DeltaTmark:LdivN)
set(gca,'XTickLabel',[0:DeltaT:T])
set(gca,'YTick',[0:DeltaFmark:kmax])
set(gca,'YTickLabel',[FreqMax:-DeltaF:0])

subplot(2,2,4), imagesc(D2), colormap(jet), 
title('Thresholded MDCT Spectrogram'),
axis tight, xlabel('Time (sec)'), ylabel('Frequency (Hz)'),
set(gca,'XTick',0:DeltaTmark:LdivN)
set(gca,'XTickLabel',[0:DeltaT:T])
set(gca,'YTick',0:DeltaFmark:kmax)
set(gca,'YTickLabel',[FreqMax:-DeltaF:0])

%The following command will write the
%compressed sound wave to the current
%work folder.

%The bit rate is set at 16, which is 
%commonly used for recording software.

%wavwrite2(xt,sr,16,'MDCTsound.wav');
audiowrite('MDCTsound.wav',xt,sr);

%After running this m-file, it may be necessary
%rename the compressed file that is written to
%the work folder so that it doesn't conflict
%with a subsequent run.


