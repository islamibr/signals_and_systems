% Excerise 6

%a
n= 0:25;
x1= 0;

for m= 0:10
x1= x1 + (m+1).*(delta(n-2*m)-delta(n-2*m-1));
end

figure; stem(n,x1);
title('x1[n]'); xlabel('n');

%b
n= -10:10;

x2= (n.^2).*(unitstep(n+5)-unitstep(n-6))+10.*delta(n) ...
+20.*(0.5.^n).*(unitstep(n-4)-unitstep(n-10));
figure; stem(n,x2);
title('x2[n]'); xlabel('n');

%c
n= 0:20;

x3= (0.9.^n).*cos(0.2*pi*n+(pi/3));

figure; stem(n,x3);
title('x3[n]'); xlabel('n');

%d
n= -10:9;

k= [1 2 3 2];
x4= [k k k k k];

figure; stem(n,x4);
title('x4[n]'); xlabel('n');