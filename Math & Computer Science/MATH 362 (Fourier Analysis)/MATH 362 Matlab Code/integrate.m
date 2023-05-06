function integrate = integrate(a,b)
global z PR CR
clear nargin

%Determine sample nodes. 

N = 2^(10);
M = N/2;
t = [a:1/N:b*(N-1)/N]';

%Enter the formulas for the function
%and convert to vertical format.

f(1:M) = 2.*t(1:M);
f(M+1:N) = 2-2.*t(M+1:N);
f = f';

%Use left sum integration.

integral = 1/N*sum(f)

plot(t,f)
title('Plot of f')
axis tight
