function fcnplot = fcnplot(x,sr,ymax)

%This program computes Fourier coefficients of f,
%and plots the time domain and spectrogram graphs. 
%ymax is the max frequency displayed in the graph. 

L = length(x);

%The following list of commands specify the values
%of various parameters needed for MATLAB's 
%spectrogram program.  Each of these inputs can
%be edited if desired. 

%First, the number of nodes used for the subintervals in
%the time domain is decided on in the next command.
%This corresponds to the block length used. 

N = 256;

%The window used to select each subinterval is 
%our next choice to make. 

window = rectwin(N);
%window = hamming(N);


%The amount of overlap of the windows is set next. 

overlap = 0;
%overlap = N - 10;

%Next, we specify the length of the FFT used on 
%the windowed subinterval.

FFTL = N;

%Now we are ready to plot the time domain graph and
%its frequency domain counterpart (the spectrogram). 

%The sample rate (sr) is required for the spectrogram
%to label the time axis with the correct time units. 

%The 'yaxis' specifies that the frequencies will be 
%placed on the vertical axis.

step = max([1,round(ymax/N)]);
F1 = [0:step:ymax];
F2= [0:10:ymax];
F3= [0:1:ymax];

figure 
subplot(2,1,1), timeplot(x,1,L,sr), 
axis tight, xlabel('Time (sec)'),
title('Time Domain Plot of Sound Wave')

subplot(2,1,2), spectrogram(x,window,overlap,F1,sr,'yaxis')
title('Spectrogram of Sound Wave')
axis([0 L/sr 0 ymax])


