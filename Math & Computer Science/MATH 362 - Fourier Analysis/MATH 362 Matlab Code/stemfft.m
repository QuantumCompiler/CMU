function stemfft = stemfft(x,T)

L = length(x);
freq = (1/T)*linspace(0,L-1,L);
hold on;
plot(freq,x, 'ob'); 
hold off;

hold on; 
for i = 1:L
   plot([freq(i) freq(i)], [0 x(i)], '-b'); 
   axis tight
end 
hold off; 
 