function matsym = matsym(A)

[M,N] = size(A);
A1=[A,A(:,N:-1:1)];
A2=[A1;A1(M:-1:1,:)]
