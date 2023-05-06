%This script plots a mbira note function x over [0,T].
%We will use the first 500 entries of x, which corresponds
%to a time span of T = 500/44100 = 0.0113 seconds. 
%The 44100 is the sample rate (samples/sec) of the recording.
    
%The mbira_pluck.wav used here is not the entire sound wave,
%instead it is a stable portion of the sound wave. 

%We start by loading the sound wave. 

x = audioread('mbira_pluck.wav');
    
%Next, determine time interval nodes. 

N = 500;
T = 0.0113;
t = [0:T/N:T*(N-1)/N]';

%Plot the function. 

plot(t,x(1:500),'b')
title('Plot of mbira note')
axis([0 T -0.06 0.06])
