function plotfft = plotfft(x,T)
clear nargin
    
N = length(x);
L = N/T;
freq =(1/T)*[1:1:N];
plot(freq,x); 
axis tight
    
 
%Needs work!