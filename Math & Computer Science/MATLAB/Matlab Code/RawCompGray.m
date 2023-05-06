function RawCompGray = RawCompGray(graypic)

grayimage = graypic;  %This saves a copy of the original grayscale image before thresholding. 

[m,n] = size(graypic);


%The following loops performs thresholding on the raw grayscale image matrix.   

gray_max = max(max(graypic)); 
gray_min = min(min(graypic));
GrayMin_GrayMax = [gray_min, gray_max]

t = input('Enter gray threshhold level: ');

Nonzeros = 0;
Threshold = 0;

for i = 1:m
   for j = 1:n
      if graypic(i,j) ~= 0
         Nonzeros = Nonzeros + 1;
      end
      if graypic(i,j)<= t & graypic(i,j)~= 0
         graypic(i,j)=0;
         Threshold = Threshold + 1;
      end
   end
end

%Graypic is now the thresholded matrix, while Grayimage is the original. 

%The following lines report the compression results. 

%Compression is defined as the ratio of the number of nonzero elements in the 
%matrix to the number of nonzero elements in thresholded matrix.

%Percent reduction is the percent difference between the number of nonzero 
%thresholded elements and the number of nonzero original image matrix elements.

NonzerosT =  Nonzeros - Threshold;

Compression_Ratio = sprintf('The compression ratio is %d to %d, or %f to %d.',...
   Nonzeros,NonzerosT,Nonzeros/NonzerosT, 1)

Percent_Reduction = (Nonzeros - NonzerosT)/Nonzeros*100

%Now graph the original and compressed grayscale images side-by-side for comparison.

figure, subplot(1,2,1), imagesc(grayimage), colormap(gray) 
subplot(1,2,2), imagesc(graypic), colormap(gray)
subplot(1,2,1)
axis image, title('Original Image')
subplot(1,2,2)
axis image, title('Compressed Image')

figure 
imagesc(graypic), colormap(gray), axis image, title('Compressed Image')





