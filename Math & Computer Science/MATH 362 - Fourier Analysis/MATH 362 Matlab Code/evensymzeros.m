function evensymzeros = evensymzeros(x) 
   
N = length(x);
y(1:4*N)=0;
for m = 1:N 
    y(2*m)=x(m);
    y(2*N+2*m)=x(N-m+1); 
end 
y = y'
stem(y') 