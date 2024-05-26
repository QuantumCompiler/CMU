function plotfft = plotfft(x,T)
    
L = length(x);
freq = (1/T)*linspace(0,L-1,L);
plot(freq,x); 
axis tight
    
 
