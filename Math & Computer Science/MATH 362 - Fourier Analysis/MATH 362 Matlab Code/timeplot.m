function plotfcn = plotfcn(x,a,b,sr)
    
L = b - a + 1;
time = (1/sr)*linspace(a,b,L);
plot(time,x(a:b));
