clear all
ds = datastore('heart_DD.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
size(T);
Alpha=.01;

m=length(T{:,1});
U0=T{:,14};
U=T{:,1:13};
U2=U.^2;
U3=sqrt(U);
%U1=T{:,20:21};

%X=[ones(m,1) U U.^2 U.^3];
%X=[ones(m,1) U U3]; % second hypothesis 
X=[ones(m,1) U U.^2]; %third hypothesis
%X=[ones(m,1) U]; %fourth hypothesis

n=length(F(1,:));
%b=length(F2(1,:));
for w=2:n
    if max(abs(F(:,w)))~=0
    F(:,w)=(F(:,w)-mean((F(:,w))))./std(F(:,w));
    end
end

P=T{:,14};
Theta=zeros(n,1);
k=1;
G=(1./(1+exp(-F*Theta)));
E(k)=(1/(m))*sum((-P.'*log(1./(1+exp(-F*Theta))))-((1-P).'*log(1-(1./(1+exp(-F*Theta))))));
%E2(s)=(1/(2*m))*sum((F2*Theta-P).^2);

R=1;
while R==1
Alpha=Alpha*1;
Theta=Theta-(Alpha/m)*F'*((1./(1+exp(-F*Theta)))-P);
k=k+1;
E(k)=(1/(m))*sum((-P.'*log(1./(1+exp(-F*Theta))))-((1-P).'*log(1-(1./(1+exp(-F*Theta))))));
if E(k-1)-E(k)<0
    break
end 
q=(E(k-1)-E(k))./E(k-1);
if q <.0001;
    R=0;
end
end
plot(1:k,E)