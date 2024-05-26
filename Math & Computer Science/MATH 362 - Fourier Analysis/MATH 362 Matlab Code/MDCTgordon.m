
function  mdct=mdct(z, block)



P = length(z);
N = block/2
num_block = P/N - 1;
NumberOfBlocks = num_block


%the outer loop is the number of data blocks you need to perform the mdct to
for j = 1:num_block
    %h starts at 1 and skips N places (half the block size)
    h = (j-1)*N+1;
    % i is the other half of h for a for loop, 2N away from h
    i = h + 2*N - 1;
    % g is the other half of h for the other for loop, N away from h
    g = h + (N) - 1;
    %k is initialized to 1 so it ranges from 1 to N
    k=1;
    %this next loop repeats N times for each block
    for r = h:g
        R=r
        X(r)=0;
        
        %n is initialized to 1 so that it ranges from 1 to 2N for each loop
        n=1;
        %this next loop repeats 2N times for each block
        for s= h:i
            S=s
            X(r) = X(r) + (z(s)*cos(pi/N*((n-1/2+N/2)*(k - 1/2))));
            x=X(r)
            n=n+1;
        end 
       k=k+1;
    end
end

X = X'


%this saves the data as a global variable that can be retrieved in any part of the program
global mdct_array
mdct_array = X;