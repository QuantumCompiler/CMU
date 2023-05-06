function VectorPlot = VectorPlot(x,a,b,c,d)
    
%x is the vector.
%The values of a and b determine the x-axis range of the plot.
%The values of c and d determine the y-axis range of the plot.

n = length(x);
k = [1:n]; %The index vector k increments by 1 from 1 to n.
plot(k,x,'o-'), axis([a b c d])


