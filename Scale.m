function [ f_new ] = Scale(f)
max=0;
for i=1:1:19
    for j=1:1:17998
        if max<f(j,i)
            max=f(j,i);
        end
    end
    for j=1:1:17998
        f(j,i)=f(j,i)/max;
    end
    
end
f_new=f;
end