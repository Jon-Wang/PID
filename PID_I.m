%------------------------------%
%PID积分作用分析
%2016-07-17
%------------------------------%
G0=tf(1,[1,3,3,1]);
Kp=1;Ti=[0.6:0.2:1.4];
t=0:0.1:20;
figure,hold on
for i=1:length(Ti);
    Gc=tf(Kp*[1,1/Ti(i)],[1,0]);
    G(i)=feedback(Gc*G0,1);
    step(G(i),t)
end
axis([0,20,-0.5,2.5]),grid on,hold off