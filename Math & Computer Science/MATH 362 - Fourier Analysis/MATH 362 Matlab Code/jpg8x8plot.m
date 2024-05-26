function jpg8x8plot = jpg8x8plot(A)

Original = A;
A = double(A);

B = A - 127

C = [0.3536, 0.3536, 0.3536, 0.3536, 0.3536, 0.3536, 0.3536, 0.3536;
0.4904,	0.4157,	0.2778,	0.0975,	-0.0975,	-0.2778,	-0.4157,	-0.4904;
0.4619,	0.1913,	-0.1913,	-0.4619,	-0.4619,	-0.1913,	0.1913,	0.4619;
0.4157,	-0.0975,	-0.4904,	-0.2778,	0.2778,	0.4904,	0.0975,	-0.4157;
0.3536,	-0.3536,	-0.3536,	0.3536,	0.3536,	-0.3536,	-0.3536,	0.3536;
0.2778,	-0.4904,	0.0975,	0.4157,	-0.4157,	-0.0975,	0.4904,	-0.2778;
0.1913,	-0.4619,	0.4619,	-0.1913,	-0.1913,	0.4619,	-0.4619,	0.1913;
0.0975,	-0.2778,	0.4157,	-0.4904,	0.4904,	-0.4157,	0.2778,	-0.0975];

D=C*B*C'

Q = [16,11,10,16,24,40,51,61;
   12,12,14,19,26,58,60,55;
   14,13,16,24,40,57,69,56;
   14,17,22,29,51,87,80,62;
   18,22,37,56,68,109,103,77;
   24,35,55,64,81,104,113,92;
   49,64,78,87,103,121,120,101;
   72,92,95,98,112,100,103,99];

R = round(D./Q)

D1 = R.*Q

A1 = round(C'*D1*C) + 127

%The next loop computes the compression ratio and percent reduction. 
[m,n] = size(A);
NonzerosDCT = 0; NonzerosJPG = 0;
tol = 0.00001;
for i = 1:m
   for j = 1:n
      if abs(D(i,j)) > tol
         NonzerosDCT = NonzerosDCT + 1;
      end
      if D1(i,j) ~= 0
         NonzerosJPG = NonzerosJPG + 1;
      end
   end
end
Nonzeros =  NonzerosDCT - NonzerosJPG;

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
NonzerosDCT,NonzerosJPG,NonzerosDCT/NonzerosJPG, 1)

Percent_Reduction = Nonzeros/NonzerosDCT*100


%The following commands set up the image plots.
L = 255;
Map=[(0:L)/L;(0:L)/L;(0:L)/L]';

figure

subplot(1,2,1), image(A),colormap(Map),
axis image, title('Original Image')

subplot(1,2,2), image(A1), colormap(Map),
axis image, title('JPEG Thresholded Image')

%figure

%image(A), colormap(Map),axis image,
%title('Original Image')

%figure

%image(A1), colormap(Map),axis image,
%title('JPEG Thresholded Image')
