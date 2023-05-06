function evenoddsymfunction = evenoddsymfunction(f) 

dimension = [size(f)];
if dimension(1) == 1
    f = f';
end

N = length(f);
g = [f;-f(N:-1:1);-f;f(N:-1:1)];
plot(g) 