% Exercise 1

y1 = 4*ones(1,200);
t2 = linspace(0,1,100);
y2 = cos(2*pi*t2/4)+3;
y3 = 3*ones(1,200);
t = linspace(-2,3,500);
y = [y1 y2 y3];

figure;
plot(t,y);
axis([-2 3 0 6], 'square'); grid on;
