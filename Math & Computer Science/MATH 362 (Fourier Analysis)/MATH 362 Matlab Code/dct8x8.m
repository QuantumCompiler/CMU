function dct8x8 = dct8x8(A)


C = [0.3536, 0.3536, 0.3536, 0.3536, 0.3536, 0.3536, 0.3536, 0.3536;
0.4904,	0.4157,	0.2778,	0.0975,	-0.0975,	-0.2778,	-0.4157,	-0.4904;
0.4619,	0.1913,	-0.1913,	-0.4619,	-0.4619,	-0.1913,	0.1913,	0.4619;
0.4157,	-0.0975,	-0.4904,	-0.2778,	0.2778,	0.4904,	0.0975,	-0.4157;
0.3536,	-0.3536,	-0.3536,	0.3536,	0.3536,	-0.3536,	-0.3536,	0.3536;
0.2778,	-0.4904,	0.0975,	0.4157,	-0.4157,	-0.0975,	0.4904,	-0.2778;
0.1913,	-0.4619,	0.4619,	-0.1913,	-0.1913,	0.4619,	-0.4619,	0.1913;
0.0975,	-0.2778,	0.4157,	-0.4904,	0.4904,	-0.4157,	0.2778,	-0.0975];

D=C*A*C'


