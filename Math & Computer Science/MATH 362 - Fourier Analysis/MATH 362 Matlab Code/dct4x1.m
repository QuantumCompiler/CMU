function dct4x1 = dct4x1(x)
%This function assumes that x is a column vector of length 4.

C = [0.5000,0.5000,0.5000,0.5000;
0.6533,0.2706,-0.2706,-0.6533;
0.5000,-0.5000,-0.5000,0.5000;
0.2706,-0.6533,0.6533,-0.2706];

d = C*x
