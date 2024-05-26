function DCTIVwin = DCTIVwin(x) 
   
  N = length(x); 
  n=[1:1:N]';
  w = sin(pi./N*(n-0.5));
  xw = w(n).*x(n);
    for k = 1:N 
        c(k)=sqrt(2/N)*sum(xw(n).*cos(pi./N*(n-1/2)*(k-1/2)))';
   end 
  c4 = c'
  stem(abs(c4))
  
  