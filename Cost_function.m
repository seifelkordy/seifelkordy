function [ mse ] = Cost_function(m,h,p)

s=0;
for i=1:1:m
d=(h(i)-p(i))^2;
s=s+d;
end
mse=s/(2*m);
end