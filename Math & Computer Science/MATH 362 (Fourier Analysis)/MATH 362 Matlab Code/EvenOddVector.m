function fcnplot = fcnplot(x) 

%Set the vector to be in vertical format. 

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end

%Create the even-odd extension y of x. 

N = length(x);
y = [x;-x(N:-1:1);-x;x(N:-1:1)];

%Print the vector y to the screen. 

y= y'

%Plot the original vector x and its even-odd extension y. 

right = 4*N+1;
height1 = min(0.8*min(y),1.2*min(y));
height2 = 1.2*max(y);

figure 
subplot(1,2,1),stem(x)
title('Plot of Original Vector')
axis([0 right height1 height2])

subplot(1,2,2),stem(y)
title('Plot of Even-Odd Extension')
axis([0 right height1 height2])
