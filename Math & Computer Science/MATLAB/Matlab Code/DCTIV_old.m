function DCTIV = DCTIV(x) 
   
  N = length(x); 
   n=[1:1:N]';
    for k = 1:N 
        c(k)=sqrt(2/N)*sum(x(n).*cos(pi./N*(n-1/2)*(k-1/2)))';
   end 
   c4 = c'
  stem(abs(c4))