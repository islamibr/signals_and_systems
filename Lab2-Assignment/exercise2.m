% Exercise 2
x= 0:0.1:10;

y_i = sin(x) ./ x;
y_ii = (1./(x-1).^2)+x;
y_iii = (x.^2+1)./(x.^2-4);
y_iiii = (((10-x).^(1/3))-2)./((4-x.^2).^(1/2));

subplot(2, 2, 1);
plot(x, y_i); title('y_i');

subplot(2, 2, 2);
plot(x, y_ii); title('y_i_i');

subplot(2, 2, 3);
plot(x, y_iii); title('y_i_i_i');

subplot(2, 2, 4);
plot(x, y_iiii); title('y_i_i_i_i');
