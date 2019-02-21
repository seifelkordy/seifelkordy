clear all
ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
size(T);
Alpha=.01;

m=length(T{:,1});
U0=T{:,2};
U=T{:,4:19};

U1=T{:,20:21};
U2=U.^2;
U3=sqrt(U);

X=[ones(m,1) U U1 U.^2 U.^3];%first hypothesis
%X=[ones(m,1) U U1 U3]; % second hypothesis 
%X=[ones(m,1) U U1]; %third hypothesis
%X=[ones(m,1) U U1 U.^3]; %fourth hypothesis

n=length(F(1,:));
%b=length(F2(1,:));
for w=2:n
    if max(abs(F(:,w)))~=0
    F(:,w)=(F(:,w)-mean((F(:,w))))./std(F(:,w));
    end
end
% for w=2:b
%     if max(abs(F(:,w)))~=0
%     F2(:,w)=(F2(:,w)-mean((F2(:,w))))./std(F2(:,w));
%     end
% end

P=T{:,3}/mean(T{:,3});
Theta=zeros(n,1);
k=1;
%s=1;

E(k)=(1/(2*m))*sum((F*Theta-P).^2);
%E2(s)=(1/(2*m))*sum((F2*Theta-P).^2);

R=1;
while R==1
Alpha=Alpha*1;
Theta=Theta-(Alpha/m)*F'*(F*Theta-P);
k=k+1;
E(k)=(1/(2*m))*sum((F*Theta-P).^2);
if E(k-1)-E(k)<0
    break
end 
q=(E(k-1)-E(k))./E(k-1);
if q <.0001;
    R=0;
end
end
plot(1:k,E)