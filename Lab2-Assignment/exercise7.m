% Exercise 7
n= 0:50;
w = randn(1,51);
x1 = cos(0.04*pi*n)+0.01*w;
x2 = cos(0.04*pi*n)+0.2*w;
x3 = cos(0.04*pi*n)+2*w;

subplot(3,1,1); stem(n,x1);
title('x[n] (\sigma = 0.01)');
subplot(3,1,2); stem(n,x2);
title('x[n] (\sigma = 0.2)');
subplot(3,1,3); stem(n,x3);
title('x[n] (\sigma = 2)');