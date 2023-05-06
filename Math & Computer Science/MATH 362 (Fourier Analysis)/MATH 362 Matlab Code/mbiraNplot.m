function mbiraNplot = mbiraNplot(N)

x = wavread('mbira.wav');
k = 20050;
y = x(k:k+N);
plot(y) 

