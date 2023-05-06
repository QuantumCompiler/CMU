function stemfft = stemfft(x,T)
    
N = length(x);
L = N/T;
y = linspace(0,L-1,L);
M = min(N,L); 
hold on;
plot((1/T)*y(1:M),x(1:M), 'ob'); 
hold off;
hold on; 
for i = 1:M 
   plot((1/T)*[y(i) y(i)], [0 x(i)], '-b'); 
   axis tight
end 
hold off; 
 
