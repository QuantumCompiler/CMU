function plotfcn = plotfcn(x,a,b,sr)
    
L = b - a + 1;
time = (1/sr)*linspace(a-1,b-1,L);
stem(time,x(a:b));
