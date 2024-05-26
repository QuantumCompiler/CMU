function plotfcn = plotfcn(x,a,b,T)
    
L = b - a + 1;
freq = (1/T)*linspace(a,b,L);
stem(freq,abs(x(a:b)));
