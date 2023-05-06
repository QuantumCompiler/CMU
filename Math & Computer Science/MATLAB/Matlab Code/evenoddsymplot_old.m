function evenoddsymplot = evenoddsymplot(x) 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end

N = length(x);
y = [x;-x(N:-1:1);-x;x(N:-1:1)];
y
stem(y) 