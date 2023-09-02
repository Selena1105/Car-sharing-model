function [p0,T]=calpT(n1,n2)
lambdaa=[4.976 5.9 6.824 5.693 1.932];
lambdab=[7.88 8.311 9.551 8.018 1.179];
ua=0.116;
ub=8.632;
p0=zeros(1,length(lambdaa));
T=zeros(1,length(lambdaa));

for j=1:length(lambdaa)
p1=0;
p2=0;
p=0;
%计算优化后的
for i=0:n1+n2
    if i>=0 && i<=n1
        p1=p1+(lambdaa(1,j)/ua+lambdab(1,j)/ub)^(i)/factorial(i);
    end
    
    if i>=n1+1 && i<=n1+n2
        p2=p2+lambdab(1,j)^(i-n1)*(lambdaa(1,j)/ua+lambdab(1,j)/ub)/factorial(i-n1)/(ub^(i-n1))/factorial(n1);
        p=p+lambdab(1,j)^(i-n1)*(lambdaa(1,j)/ua+lambdab(1,j)/ub)^(n1)/factorial(i-n1)/(ub^(i-n1))/factorial(n1);
    end
end
p0(1,j)=(p1+p2)^(-1);
Tb=lambdab(1,j)^n2*(lambdaa(1,j)/ua+lambdab(1,j)/ub)^(n1)*p0(1,j)*lambdab(1,j)*ub/factorial(n1)/factorial(n2)/(ub^(n2));
Ta=p*p0(1,j)*lambdaa(1,j)*ua;
if j~=1
T(1,j)=Ta+Tb+T(1,j-1);
end

end
end