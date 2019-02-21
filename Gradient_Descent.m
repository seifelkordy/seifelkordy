function [ theta_new,costfn,iterations ] = Gradient_Descent( f,prices )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
alpha=0.03;
m=size(prices,1);
j=size(f,2);
theta_new=Normal_Equation(f,prices);
%theta_old=zeros(19,1);
h=theta_new'*f';
costfn=[];
costtr=0;

     iterations=1;  
     costfn(iterations)=Cost_function(m,h,prices);
     while costfn(iterations)-costtr>0.001
         %theta_old(k)=theta_new(k); 
         for k=1:1:19
         costtr=Cost_function(m,h,prices);
         h=theta_new'*f';
         mse=Mean_Square_Error(m,h,prices,j,f);
         theta=theta_new(k)-(alpha*mse);
         theta_new(k)=theta;
         %costtr=Cost_function(m,h,prices);
         end
         iterations=iterations+1;
         costfn(iterations)=Cost_function(m,h,prices);
         
     end
 
end

