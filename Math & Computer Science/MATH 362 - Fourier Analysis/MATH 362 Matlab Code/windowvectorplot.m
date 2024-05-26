function windowvectorplot = windowvectorplot(x) 
  
  N = length(x); 
  n=[1:1:N]';
  w = sin(pi./N*(n-0.5));
  xw = w(n).*x(n)
  stem(xw)