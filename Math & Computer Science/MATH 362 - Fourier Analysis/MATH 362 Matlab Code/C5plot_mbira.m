function mbiraC5plot = mbiraC5plot(N)

%The first two command lines generate f_N
tN = [0:1/N:(N-1)/N];
fN = sin(2*pi*523.25*tN); 

%The first of the next two commands generate x,
%where x is the first 10 values of f_N.
%There is no semicolon after this command,
%so that the output prints to the screen. 
%Next, the tNx vector generates the vector
%of the first 10 values of tN, so that
%x can be plotted on these first 10 nodes. 

x = fN(1:10)
tNx = tN(1:10);

%The next four commands generates f_220 on [0, 0.005].

T = 0.005;
M = 220;
tM = [0:T/M:(M-1)/M*T];
fM = sin(2*pi*523.25*tM);

%The final two commands produces two plots and 
%formats them side-by-side in a figure output window. 

figure
subplot(1,2,1), plot(tNx,x,'bo',tM,fM,'r')
subplot(1,2,2), plot(tM,fM,'bo',tM,fM,'r') 

%figure
%plot(tNx,x,'bo',tM,fM,'r')

%figure
%plot(tM,fM,'bo',tM,fM,'r') 





