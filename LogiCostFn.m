function [ E ] = LogiCostFn( k,m,Theta,F,P )

E(k)=(1/(m))*sum((-P.'*log(1./(1+exp(-F*Theta))))-((1-P).'*log(1-(1./(1+exp(-F*Theta))))));

end

