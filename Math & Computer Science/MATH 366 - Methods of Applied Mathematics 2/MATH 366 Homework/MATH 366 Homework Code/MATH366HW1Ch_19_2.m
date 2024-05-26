function qformula(a,b,c)

%This program computes the solutions x1, x2, of ax^2 + bx + c = 0
%In a way that minimizes the effects of cancellation

%We will assume that b is nonzero and b^2-4ac > 0.
%The case b = 0 is easy to solve, as is the case b^2 - 4ac = 0.
%The case b^2 - 4ac < 0 involves complex roots, which is outside
%our immediate scope of study.

d=sqrt(b^2-4*a*c);
x1 = 0;
x2 = 0;
Loop = 0;
test = (4*a*c)/b^2;
eps = 0.1;
if test > eps
    x1 = (-b + d)/(2*a);
    x2 = (-b - d)/(2*a);
    Loop = 1;
elseif test <= eps
    if b > 0
        x2 = (-b - d)/(2*a);
        x1 = c/(a*x2);
        Loop = 2;
    elseif b < 0
        x1 = (-b + d)/(2*a);
        x2 = c/(a*x1);
        Loop = 3;
    end
end
solution = [eps, test, Loop, x1, x2]