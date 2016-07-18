%------------------------------%
%PID近似微分分析
%2016-07-17
%------------------------------%
G0=tf(1,[1,3,3,1]);Kp=1;Ti=1;Td=1;N=[100,1000,10000,1,10];
Gc=tf(Kp*[Ti*Td,Ti,1]/Ti,[1,0]);
G=feedback(Gc*G0,1);    %完全微分控制
figure,hold on
step(G)
for i=1:length(N) %不完全微分控制
    nn=Kp*(conv([Ti,1],[Td/N(i),1])+conv([Ti,0],[Td,0]));
    dd=conv([Ti,0],[Td/N(i),1]);
    Gc=tf(nn,dd);
    G=feedback(Gc*G0,1);
    step(G)
end
grid on
[y,t]=step(G);
error=1-y;
figure
plot(t,error);grid on