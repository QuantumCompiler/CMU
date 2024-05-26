function VectorThresh = VectorThresh(x,r,c,d)

%x is the vector, r is the threshold value
%c and d determine the y-axis range of the plot window. 
 
%The following two variables will be used to do the thresholding count. 
ThresholdCount = 0;
Nonzeros_x = 0;

%Here y is initialized to match x.
%Then y will be thresholded while x is preserved. 
y = x;  

%The thresholding loops for y are next. 
N = length(x);
for k = 1:N
   if y(k) ~= 0
      Nonzeros_x = Nonzeros_x + 1;
   end
   if abs(y(k))< r & abs(y(k))~= 0
      y(k)=0;
      ThresholdCount = ThresholdCount + 1;
   end
end

%Printed to the screen here are r, x & y:
Threshold_r_value = r
x = x
y = y

%The following lines report the compression results. 

Nonzeros_y =  Nonzeros_x - ThresholdCount;

Compression_Ratio = sprintf('The compression ratio is %d to %d, or %f to %d.',...
   Nonzeros_x,Nonzeros_y,Nonzeros_x/Nonzeros_y, 1)

Percent_Reduction = ThresholdCount/Nonzeros_x*100

%Now graph the original and compressed vectors side-by-side for comparison.

tN = [1:N];

figure
subplot(1,2,1), plot(tN,x,'bo',tN,x,'r'), axis([0 N+1 c d])
title('Original Vector')
subplot(1,2,2), plot(tN,y,'bo',tN,y,'r'), axis([0 N+1 c d])  
title('Thresholded Vector')

figure
plot(tN,x,'bo',tN,x,'r'), axis([0 N+1 c d])
title('Original Vector')

figure
plot(tN,y,'bo',tN,y,'r'), axis([0 N+1 c d])  
title('Thresholded Vector') 


