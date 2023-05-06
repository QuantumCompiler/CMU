function fcnplot = fcnplot(N)

%So-called windows are used to select time-domain 
%subintervals for constructing a spectrogram. 

%This program plots several commonly used windows.  

x = rectwin(N);
y = hamming(N);

figure 
subplot(2,1,1), plot(x), axis ([-1,N+2, 0, 1.2]), 
title('Plot of Rectangular Window')

subplot(2,1,2), plot(y), axis ([-1,N+2, 0, 1.2]), 
title('Plot of Hamming Window')


