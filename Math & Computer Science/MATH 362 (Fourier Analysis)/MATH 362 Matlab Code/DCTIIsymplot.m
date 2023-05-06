function DCTIIsymplot = DCTIIsymplot(x) 
   
N = length(x);
y(1:4*N)=0;
for m = 1:N 
    y(2*m)=x(m)/2;
    y(2*N+2*m)=x(N-m+1)/2; 
end 
y'
stem(y') 