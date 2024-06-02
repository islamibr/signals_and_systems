% Exercise 3

t= 0:0.01:40;
n= 0:40;

x_nT = cos((2/3)*(n*2));
y_nT = cos((8*pi/38)*(n*2));
x_t = cos((2/3)*t);
y_t = cos((8*pi/38)*t);

figure; stem(n,x_nT);
title('x[nT]'); xlabel('n');
figure; plot(t,x_t);
title('x(t)'); xlabel('t');
%Sequance is not periodic since its angular frequancy is not a multiple of
%2?

figure; stem(n,y_nT);
title('y[nT]'); xlabel('n');
figure; plot(t,y_t);
title('y(t)'); xlabel('t');

%Sequance is periodic with a period (N = 19) since its angular frequancy is
%a multiple of 2?
%One period contains two cycles of the continous time signal
