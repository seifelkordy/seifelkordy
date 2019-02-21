
function [ mse ] = Mean_Square_Error(m,h,p,j,f)

s=0;
for i=1:1:m
d=(h(i)-p(i))*f(i,j);
s=s+d;
end
mse=s/m;
end

