% This script implements a numerical method for solving the
% hyperbolic PDE as shown in Example 1 of Ch. 21.7 of our book.
% The book uses m = 2 internal nodes & symmetry per time step

n = 6;  %Number of time steps from t = 0 to t = 1.
N = 7;  %Number of columns in solution matrix S

h = 0.2;    %Mesh size for x
k = h;  %Mesh size for t
xnodes = [0:h:1];
tnodes = [0:k:1];
f = sin(pi*xnodes);     %Initial spatial distribution

% Construct solution matrix S
S = zeros(n,N);
S(:,1) =  tnodes;   %This is to match first columnof table in book
S(1,2:N) = f;       %First row of S is f

% The second row uses Eqn (8) from book (initial conditions using g)
for i = 3:N-1
    S(2,i)=0.5*(S(1,i-1)+S(1,i+1))
end

% To compute subsequent rows of S, we use Eqn (6) from our book.
% The book uses row symmetry to reduce flops. However, the loop below
% is a direct application of Eqn (6) and does not use row symmetry,
% which is OK for us.
for k = 3:n
    for i = 3:N-1
        S(k,i)=S(k-1,i-1)+S(k-1,i+1)-S(k-2,i)
    end
end
%S

% We next graph analytical solution u(x,t) for different time values.
% The analytical solution is u(x,t) = sin(pi*x)*cos(pi*t).
% The analytical solution will be sampled on x = 20 spatial nodes.

M = 20;
x = [0:1/M:1]';
f1 = sin(pi*x)*cos(pi*0);
f2 = sin(pi*x)*cos(pi*0.2);
f3 = sin(pi*x)*cos(pi*0.4);
f4 = sin(pi*x)*cos(pi*0.6);
f5 = sin(pi*x)*cos(pi*0.8);
f6 = sin(pi*x)*cos(pi*1.0);

% Plot analytical solution and numerical solution.
figure

subplot(1,2,1)
plot(x,[f1,f2,f3,f4,f5,f6],'b')
title('Plot of String Displacement at Various Time Steps')
axis([0 1 -1.1 1.1])

subplot(1,2,2)
mesh(S(:,2:N))
title('Plot of String Displacement Over Elapsed Time')
axis([0 N 0 n -1 1])