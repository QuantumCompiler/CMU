function fftdct2 = fftdct2(A)

[M,N] = size(A);
A1=[A,A(:,N:-1:1)];
A2=[A1;A1(M:-1:1,:)]

A3 = A2 - 127
A4 = 1/(sqrt(2)*M*N)*fft2(A3)

D = round(real(A4(1:M,1:N))) + 127
