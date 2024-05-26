function  RawImageThreshBW =  RawImageThreshBW(A,r)

B = A;
[m,n] = size(B);

%Threshold A using r as the cut-off level. 
%Also, we keep track of the number of nonzero 
%entries that have been thresholded. 

ThresholdCount = 0;
Nonzeros_A = 0;


for i = 1:m
   for j = 1:n
      if B(i,j) ~= 0
         Nonzeros_A = Nonzeros_A + 1;
      end
      if B(i,j)< r & B(i,j)~= 0
         B(i,j)=0;
         ThresholdCount = ThresholdCount + 1;
      end
   end
end

%The following commands, when not suppressed, report 
%the original matrix and the thresholded matrix:

 Original_Matrix = A
 Thresholded_Matrix = B

%The following lines report the compression results. 

Nonzeros_B =  Nonzeros_A - ThresholdCount;

Compression_Ratio = sprintf('The compression ratio is %d to %d, or %f to %d.',...
   Nonzeros_A,Nonzeros_B,Nonzeros_A/Nonzeros_B, 1)

Percent_Reduction = ThresholdCount/Nonzeros_A*100

%Now graph the original and compressed grayscale images 
%side-by-side for comparison.

figure, subplot(1,2,1), MatrixPlot(A)  
subplot(1,2,2), MatrixPlot(B) 
subplot(1,2,1)
axis image, title('Original Image')
subplot(1,2,2)
axis image, title('Compressed Image')

%The following commands, when not suppressed,
%plot the original and thresholded matrices
%in separate figure windows. 

figure 
MatrixPlot(A), axis image, title('Original Image')

figure 
MatrixPlot(B), axis image, title('Compressed Image')





