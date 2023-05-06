function  RawImageThreshBW =  RawImageThreshBW(A,r)

global z PR CR

[m,n] = size(A);

%Initialize the vector x as a column vector of zeros.
x = zeros(m*n,1);

% Overwrite the entries of x with the entries of A. 
% This is done by taking the columns of A and
% inserting them, one after the other, into x. 


for j = 1:n
x((j-1)*m+1:j*m) = A(:,j);
end

%Threshold x at r percent using the external threshold program.  

N = length(x);
c = x;
threshold(c,r)
ct = z;

%Construct the thresholded matrix B from the thresholded x. 

for j = 1:n
B(:,j) = ct((j-1)*m+1:j*m);
end

%The following commands, when not suppressed, report 
%the original matrix and the thresholded matrix.
%This output is helpful for small matrices.  

 Original_Matrix = A
 Thresholded_Matrix = B

%Report the thresholding results.

Percent_Reduction = ...
sprintf('The percent reduction is %f.',PR)

Compression_Ratio = ...
sprintf('The compression ratio is %d to %d, or %f to %d.',...
CR(1),CR(2), CR(1)/CR(2), 1)

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





