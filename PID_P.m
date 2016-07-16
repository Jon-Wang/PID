%------------------------------%
%PID比例作用分析
%2016-07-16
%------------------------------%
G0=tf(1,[1,3,3,1]);
P=[0.1 0.3 0.5 1 2 3];
figure,hold on
for i=1:length(P)
    G=feedback(P(i)*G0,1);
    step(G)
end
axis([0,12,0,1.3]),grid on,hold off
figure
rlocus(G0),axis([-2,0.2,-2,2])
k=rlocfind(G0)