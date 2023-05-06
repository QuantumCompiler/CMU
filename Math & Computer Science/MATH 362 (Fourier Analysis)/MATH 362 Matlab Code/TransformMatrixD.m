function TransformMatrixD = TransformMatrixD(A,G00,G01,G10,G11) 

%This program computes the 2x2 transform matrix of A 
%relative to the 2x2 matrices G00, G01,G10,G11. 

D(1,1) = MatrixDot(A,G00)/MatrixDot(G00,G00);
D(1,2) = MatrixDot(A,G01)/MatrixDot(G01,G01);
D(2,1) = MatrixDot(A,G10)/MatrixDot(G10,G10);
D(2,2) = MatrixDot(A,G11)/MatrixDot(G11,G11);

D = D




