%基于排队模型的优化模型
clc,clear,close all
n1=2; %提供给普通会员和活跃会员的车的数量
n2=3; %提供给活跃会员的车的数量
n3=4;
n4=5;
n=4;
t=[16 17 18 19 21];
lambda=[12.856 14.211 16.533 13.711 3.111];
lambdaa=[4.976 5.9 6.824 5.693 1.932];
lambdab=[7.88 8.311 9.551 8.018 1.179];
u=0.143;
ua=0.116;
ub=8.632;
pL=zeros(1,length(lambda));
T0=zeros(1,length(lambda));

for j=1:length(lambdaa)
p00=0;
%计算优化前的
for i=0:n
    p00=p00+(lambda(1,j)/u)^(i)/factorial(i);
end
pL(1,j)=(lambda(1,j)/u)^(n)*p00^(-1)/factorial(n);
if j~=1
T0(1,j)=lambda(1,j)*pL(1,j)*u*t(1,j)+T0(1,j-1);
end
end

[p1,T1]=calpT(n1,n2);
[p2,T2]=calpT(n1,n3);
[p3,T3]=calpT(n1,n4);


figure
% plot(pL,'r.-')
% ylabel('Customer loss rate')
% xlabel('time')
% hold on
plot(p1,'b*-','LineWidth',1)
hold on
plot(p2,'black+-','LineWidth',1)
hold on
plot(p3,'.-')
legend('n2=3','n2=4','n2=5')
ylabel('Customer loss rate')
xlabel('time')

figure
plot(T0,'b.-')
hold on 
plot(T1,'r.-')
hold on 
plot(T2,'g.-')
hold on 
plot(T3,'black.-')
legend('before optimization','n2=3','n2=4','n2=5')
ylabel('Total loss time')
xlabel('time')