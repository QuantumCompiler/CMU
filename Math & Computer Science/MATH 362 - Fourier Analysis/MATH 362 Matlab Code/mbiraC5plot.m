%This script plots a mbira note function x over [0,T],
%and also a plot of fN = A*sin(2*pi*523.25*t) over [0,T]. 
%The amplitude A of fN will be determined in such a way as to 
%match the amplitude of x. 

x = audioread('mbira_pluck.wav');

%Next, determine time interval nodes.
%These will be used to plot x and fN. 

N = 500;
T = 0.0113;
tN = [0:T/N:T*(N-1)/N]';

%Now we input the commands for fN on tN. 

A = max(x(1:N));
fN = A*sin(2*pi*523.25*tN); 

%The final two commands produces two plots and 
%formats them side-by-side in a figure output window. 

figure

subplot(1,2,1), plot(tN,x(1:N),'b')
title('Plot of the Mbira Sound Wave')

subplot(1,2,2), plot(tN,fN(1:N),'r')
title('Plot of the C5 Sound Wave')

figure
plot(tN,x(1:N),'b')
title('Plot of the Mbira Sound Wave')

figure
plot(tN,fN(1:N),'r')
title('Plot of the C5 Sound Wave')






