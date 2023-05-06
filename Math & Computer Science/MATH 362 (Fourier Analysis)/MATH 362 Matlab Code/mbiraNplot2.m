function mbiraNplot = mbiraNplot(N)

x = wavread('mbira.wav');
k = 20051;
y = x(k:k+(N-1));

tN = [0:1/N:(N-1)/N];
A = max(y);
fN = A*sin(2*pi*523.25*tN/N); 

Ly = length(y)
Lt = length(tN)
Lf = length(fN)

plot(tN,fN,'r',tN,y,'b') 



