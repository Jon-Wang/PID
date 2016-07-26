%------------------------------%
%PIDÎ¢·Ö·´À¡
%2016-07-21
%------------------------------%
G0=tf(1,[1,3,3,1]);Kp=1;Ti=1;Td=1;N=10;
Gc1=tf(Kp*[Ti,1],[Ti,0]);
num1=Kp*(conv([Ti,1],[Td/N,1])+conv([Ti,0],[Td,0]));
den1=conv([Ti,0],[Td/N,1]);
Gc=tf(num1,den1);
G1=feedback(Gc*G0,1);   
G3=feedback(G0,tf([Td,0],[Td/N,1]));   
G2=feedback(Gc1*G3,1);   
step(G1,'r',G2,'b');
grid on,axis([0,25,0,1.6])

