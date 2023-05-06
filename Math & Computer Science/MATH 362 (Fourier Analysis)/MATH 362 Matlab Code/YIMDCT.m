function IMDCT  
  
  global cm
  x = cm; 
  N = length(x);
  M = 2*N; 
  m=[1:1:N]';
    for k = 1:M 
        c(k)=sqrt(1/N)*sum(x(m).*cos(pi./N*(k-1/2+N/2)*(m-1/2)));
   end 
  y = c'
  stem(abs(y))