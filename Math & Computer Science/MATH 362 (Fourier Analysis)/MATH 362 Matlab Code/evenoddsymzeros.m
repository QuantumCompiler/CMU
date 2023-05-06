function evenoddsymzeros = evenoddsymzeros(x) 
   
  N = length(x); 
  y(1:8*N)=0; 
   for m = 1:N 
    y(2*m)=x(m)/4; 
   end 
   for m = N+1:2*N 
    y(2*m)=-x(2*N-m+1)/4; 
   end 
   for m = 2*N+1:3*N 
    y(2*m)=-x(m-2*N)/4; 
   end 
   for m = 3*N+1:4*N 
    y(2*m)=x(4*N-m+1)/4; 
   end 
  
   y'
   stem(y') 