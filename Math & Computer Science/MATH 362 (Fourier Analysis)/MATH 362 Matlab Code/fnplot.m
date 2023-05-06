function fNplot = fNplot(N)

%First, we set up the node vector, then sample the function f on it. 
%Node vector increments by 1/N from 0 to (N-1)/N.
%The function f is then evaluated on the node vector tN. 

tN = [0:1/N:(N-1)/N]   
fN = cos(2*pi*tN)  

%Next, we repeat the above commands for a larger sample size M.
%This will enable us to get a better graph of the function f. 
%Note that each command ends with a semicolon ";".
%The semicolon suppresses output so it doesn't print to the workspace. 
%Compare this with the above commands for tN and fN.  
%They print to the workspace so that the HW problems can be answered. 

M = 100;
tM = [0:1/M:(M-1)/M];   
fM = cos(2*pi*tM); 

plot(tN,fN,'o-r',tM,fM,'b') 
%The plot of each point (tN,fN) is red and is shaped as an "o".
%The points "o" are connected by a solid line "-".
%The plot of each (tM,fM) is small, blue, and auto-connected.


