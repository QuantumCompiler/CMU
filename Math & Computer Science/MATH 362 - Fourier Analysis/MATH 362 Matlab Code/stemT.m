function stemT = stemT(x,T)

%Set up the scaling for the horizontal axis. 
   
L = length(x);
freq = (1/T)*linspace(0,L-1,L);

%Plot the frequency domain graph.

height = 1.2*max(x);
right = round(L/T)+0.2;

figure
stem(freq,x)
title('Fourier Coefficient Magnitudes')
axis([-0.2 right 0 height])
    
 
