function windowplot = windowplot(N) 
   
  n=[0:1:N-1]';
  w = sin(pi./N*(n+0.5));
  stem(w)