function windowvectormp3 = windowvectormp3(x) 
  
  N = length(x); 
  n=[1:1:N]';
  w = sqrt(2)*sin(pi./N*(n-0.5));
  xw = w(n).*x(n)
  stem(xw)