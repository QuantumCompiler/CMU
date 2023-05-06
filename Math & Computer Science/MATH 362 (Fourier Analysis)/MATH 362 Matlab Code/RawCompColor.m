function RawImageThreshColor =  RawImageThreshColor(A,r)

[m,n,k] = size(A)

colorpic = jpgpic;   %This saves a copy of the original grayscale image before thresholding. 

r = jpgpic(:,:,1);
g = jpgpic(:,:,2);
b = jpgpic(:,:,3);

[m,n]=size(r);

%The following loops perform thresholding on the r, g, and b matrices. 

%Start with the red matrix:

red_max = max(max(r)); 
red_min = min(min(r));
RedMin_RedMax = [red_min, red_max]

tr = input('Enter red threshhold level: ');

Nonzerosr = 0;
ThresholdR = 0;

for i = 1:m
   for j = 1:n
      if r(i,j) ~= 0
         Nonzerosr = Nonzerosr + 1;
      end
      if r(i,j)<= tr & r(i,j)~= 0
         r(i,j)=0;
         ThresholdR = ThresholdR + 1;
      end
   end
end


%Now for the green matrix:

green_max = max(max(g));
green_min = min(min(g));
GreenMin_GreenMax = [green_min, green_max]

tg = input('Enter green threshhold level: ');

Nonzerosg = 0;
ThresholdG = 0;

for i = 1:m
   for j = 1:n
      if g(i,j) ~= 0
         Nonzerosg = Nonzerosg + 1;
      end
      if g(i,j)<= tg & g(i,j)~= 0
         g(i,j)=0;
         ThresholdG = ThresholdG + 1;
      end
   end
end


%Now for the blue matrix:

blue_max = max(max(b));
blue_min = min(min(b));
BlueMin_BlueMax = [blue_min, blue_max]

tb = input('Enter blue threshhold level: ');

Nonzerosb = 0;
ThresholdB = 0;

for i = 1:m
   for j = 1:n
      if b(i,j) ~= 0
         Nonzerosb = Nonzerosb + 1;
      end
      if b(i,j)<= tb & b(i,j)~= 0
         b(i,j)=0;
         ThresholdB = ThresholdB + 1;
      end
   end
end


%Next, we reconstruct the compressed (thresholded) approximation matrix ca. 

ca(:,:,1) = r;
ca(:,:,2) = g;
ca(:,:,3) = b;


%The following lines report the compression results. 

%Compression is defined as the ratio of the number of 
%nonzero elements in the original matrix to the number of 
%nonzero elements in thresholded matrix.

%Percent reduction is the ratio of the number of 
%nonzero thresholded elements to the number of 
%nonzero original image matrix elements.

ThresholdSum = ThresholdR + ThresholdG + ThresholdB;
NonzerosSum = Nonzerosr + Nonzerosg + Nonzerosb;
Nonzerost =  NonzerosSum - ThresholdSum;

Compression_Ratio = sprintf('The compression ratio is %d to %d, or %f to %d.',...
   NonzerosSum,Nonzerost,NonzerosSum/Nonzerost, 1)

Percent_Reduction = ThresholdSum/(3*m*n)*100


%Now graph the original and compressed images side-by-side for comparison.

figure, subplot(1,2,1), image(colorpic) 
subplot(1,2,2), image(ca)
subplot(1,2,1)
axis image, title('Original Image')
subplot(1,2,2)
axis image, title('FFT Compressed Image')

figure
image(ca), axis image

