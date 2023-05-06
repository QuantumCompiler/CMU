function winblockplot = winblockplot(N) 

m = 2*N;
L = 2*m;
k = [1:1:m]';
w = sqrt(2)*sin(pi./m*(k-0.5));

%Compute and plot the MDCT window blocks.
for B = 0:N:L-m;
   xw(B+1:B+m) = w(1:m);
   stem(xw)
end

