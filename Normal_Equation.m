function [ theta ] = Normal_Equation( f,p )

theta=(f.'*f)\(f.'*p);
%theta=pinv(f'*f)*f'*p;
end

