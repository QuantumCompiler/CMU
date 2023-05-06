function DotVectorPlot = DotVectorPlot(x,y,a,b,c,d)
    
%x and y are the vectors to be used in the inner (dot) product.
%The values of a and b determine the x-axis range of the plot.
%The values of c and d determine the y-axis range of the plot.

inner_product = dot(x,y)

n = length(x);
k = [1:n]; %The index vector k increments by 1 from 1 to n.

figure
subplot(1,2,1), plot(k,x,'o-'), axis([a b c d]), title('Vector Plot of x')  
subplot(1,2,2), plot(k,y,'o-'), axis([a b c d]), title('Vector Plot of y')


figure
plot(k,x,'o-'), axis([a b c d]), title('Vector Plot of x')

figure
plot(k,y,'o-'), axis([a b c d]), title('Vector Plot of y')




