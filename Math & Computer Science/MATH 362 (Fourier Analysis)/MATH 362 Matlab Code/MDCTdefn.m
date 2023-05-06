function MDCT = MDCT(x,N) 
   
dimension = [size(x)];
if dimension(1) == 1
    x = x';
end   

%N is the block size and is an even number
L = length(x);
M = 2*N;
n=[1:1:M]';

for B = 0:N:L-M;
   for k = 1:N 
       c(k)= sqrt(1/N)*sum(x(n+B).*cos(pi./N*(n-1/2+N/2)*(k-1/2)));
   end 
   cm(B+1:B+N) = c(1:N);
end

cm = cm'
%stem(abs(cm))
  
  

