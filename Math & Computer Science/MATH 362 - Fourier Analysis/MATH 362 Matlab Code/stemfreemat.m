function [A] = stem(x)

dimension = [size(x)];
if dimension(1) == 1
    x = x';
end
    
    N = length(x); 
    n = nargin; 
    para = 'ob'; 
    parb = '-b'; 
    x = x(1:N)';
    y = [1:1:N];
    if(n == 1) 
        y = linspace(0,size(x,2)-1,size(x,2)); 
    elseif(n == 2) 
        if(isa(y, 'char')) 
            [para, parb] = processLineSpec(y); 
            y = linspace(0,size(x,2)-1,size(x,2)); 
        end 
    elseif(n == 3) 
       [para, parb] = processLineSpec(par); 
    end 
    hold on;
    plot(y,x, para); 
    z=zeros(1,N);
    plot(y,z,'Color','black');
    hold off;
    a = min(x);
    b = min(a,0);
    c = max(x);
    ylim ([b c]); 
    hold on; 
    for i = 1:size(x,2) 
        plot([y(i) y(i)], [0 x(i)], parb); 
    end 
    hold off; 
 
function [A,B] = processLineSpec(lis); 
    n = strfind(lis, '-.'); 
    lis(n+1) = ';'; 
    B = lis(find(lis~='.'&lis~='o'&lis~='x'&lis~='+'&lis~='*'&lis~='s'&lis~='d'&lis~='v'&lis~='^'&lis~='>'&lis~='<')); 
    A = lis(find(lis~='-'&lis~=':'&lis~=';')); 
    n = strfind(B, ';'); 
    B(n) = '.'; 
 