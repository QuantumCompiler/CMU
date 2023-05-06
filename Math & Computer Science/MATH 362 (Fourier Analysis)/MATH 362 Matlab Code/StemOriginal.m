function [A] = stem(X, Y, par) 
    n = nargin; 
    para = 'ob'; 
    parb = '-b'; 
    if(n == 1) 
        Y = linspace(0,size(X,2)-1,size(X,2)); 
    elseif(n == 2) 
        if(isa(Y, 'char')) 
            [para, parb] = processLineSpec(Y); 
            Y = linspace(0,size(X,2)-1,size(X,2)); 
        end 
    elseif(n == 3) 
       [para, parb] = processLineSpec(par); 
    end 
    plot(Y,X, para); 
    ylim ([0 max(X)]); 
    hold on; 
    for i = 1:size(X,2) 
        plot([Y(i) Y(i)], [0 X(i)], parb); 
    end 
    hold off; 
end 

function [A,B] = processLineSpec(lis); 
    n = strfind(lis, '-.'); 
    lis(n+1) = ';'; 
    B = 
lis(find(lis~='.'&lis~='o'&lis~='x'&lis~='+'&lis~='*'&lis~='s'&lis~='d'&lis~='v'&lis~='^'&lis~='>'&lis~='<')); 
    A = lis(find(lis~='-'&lis~=':'&lis~=';')); 
    n = strfind(B, ';'); 
    B(n) = '.'; 
end 