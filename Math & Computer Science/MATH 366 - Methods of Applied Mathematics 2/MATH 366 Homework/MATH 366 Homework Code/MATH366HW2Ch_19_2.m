function Newton(x0,N)
%This function performs Newton's Method.
%Initial value = x0
%Number of iterations = N

%First we input the formulas for f(x) and f'(x)
%The @ symbol tells MATLAB to plug x into the formula.
f = @(x) 1.0*x^3 + 1.0*x - 1.0;
fp = @(x) 3.0*x^2 + 1.0;

%Next, we form the iteration function g(x)
g = @(x) x - f(x)/fp(x);

%The following "for loop" performs the iteration.
%The vector x records the values of the iteration.
%The first vallue of the vector x will be be the user input x0.
x(1)=x0;
for k = 2:N
    x(k) = g(x(k-1));
end

%The results of the iteration is reported as column vector x'
%The apostrophe represents the transpose of x.
Iteration_Vector = x'

end