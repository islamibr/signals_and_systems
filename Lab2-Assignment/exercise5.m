% Exercise 5

L = 5;
R = 7;
x = [1 -2 4 6 -5 8 10]; % Zeroth index at -5
x_n = [zeros(1,L) x zeros(1,R)];
n = (1:length(x_n)) - 10;

figure; stem(n, x_n);
title('x[n]'); xlabel('n');

%I
x_2L = [zeros(1,L-2) x zeros(1,R+2)];
x_4R = [zeros(1,L+4) x zeros(1,R-4)];

x1= 3 * x_2L + x_4R + 2 * x_n;
figure; stem(n, x1);
title('x1[n]'); xlabel('n');

%II
x_4L = [zeros(1,L-4) x zeros(1,R+4)];
x_1R = [zeros(1,L+1) x zeros(1,R-1)];
x_r2R = [zeros(1,L+4) fliplr(x) zeros(1,r-4)];

x2 = (x_4L .* x_1R) + (x_r2R .* x_n);

figure; stem(n,x2);
title('x2[n]'); xlabel('n');

%III
x3 = 0;

for k=1:5
    x_k = [zeros(1,L+k) x zeros(1,R-k)];
    x3 = x3 + n .* x_k;
end

figure; stem(n,x3);
title('x3[n]'); xlabel('n');

