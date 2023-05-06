function trapezoid(a,b,n)
%This program uses the trapezoid method (T-rule) to compute the value 
%of the area of f(x) over [a,b] using n trapezoids.
%User input: a, b, and n

%First we input the formulas for f(x)
%The @ symbol tells MATLAB to plug x into the formula.
%f = @(x) exp(-x.^2);
f = @(x) 1.0*x.^2 + 1.0;

h = (b-a)/n;        %Compute step size h
nodes = [a:h:b];    %Generate node vector using increment = h
N = length(nodes);  %N = number of nodes (should = n+1)
yvalues(1:n+1) = f(nodes(1:n+1)); %Generate vector of f(x) vales at nodes

T = 1/2*(f(a) + f(b)); %Compute first and last values of T-rule
for k = 2:n            %Compute the middle part of the T-rule
  T = T + yvalues(k);
end

T = h*T     %Since no semicolon, this will print to screen
plot(nodes,yvalues,'-o')    %Plot vector ordered pairs; s = square
xlabel('x')
legend('f', 'Location','northeast')