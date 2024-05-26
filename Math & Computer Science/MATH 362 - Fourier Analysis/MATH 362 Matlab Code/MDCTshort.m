function MDCT = MDCT(x) 
   
  M = length(x); 
  N = M/2;
   n=[1:1:M]';
    for k = 1:N 
        c(k)=sqrt(1/N)*sum(x(n).*cos(pi./N*(n-1/2+N/2)*(k-1/2)));
   end 
   
   global cm
   cm = c'
  stem(abs(cm))
  
