% Exercise 8

n= -10:10;
x = exp((-0.1+0.3j)*n);

magnitude = abs(x);
phase = angle(x);

real_part = real(x);
imaginary_part = imag(x);

subplot(2,2,1);
stem(n,magnitude); title('Magnitude');
xlabel('n'); ylabel('|x|');

subplot(2,2,2); stem(n,phase); 
title('Phase');
xlabel('n'); ylabel('arg(x) [rad]');

subplot(2,2,3); stem(n,real_part); 
title('Real part');
xlabel('n'); ylabel('Re(x)');

subplot(2,2,4); stem(n,imaginary_part);
title('Imaginary part');
xlabel('n'); ylabel('Im(x)');