% Exercise 3

% I

Fs= 5000;
Ts= 1/Fs;
n= 0:50;

x_a1 = sin(2*pi*500*Ts*n);
x_a2 = sin(2*pi*2000*Ts*n);
x_a3 = sin(2*pi*3000*Ts*n);
x_a4 = sin(2*pi*4500*Ts*n);

subplot(2, 2, 1);
stem(n, x_a1); title('F_o = 0.5KHz')
axis([0 50 -1.5 1.5])

subplot(2, 2, 2);
stem(n, x_a2); title('F_o = 2KHz')
axis([0 50 -1.5 1.5])

subplot(2, 2, 3);
stem(n, x_a2); title('F_o = 3KHz')
axis([0 50 -1.5 1.5])

subplot(2, 2, 4);
stem(n, x_a2); title('F_o = 4.5KHz')
axis([0 50 -1.5 1.5])

%The plots with frequancies 3KHz and 4.5 KHz have lost information
%since Nyquist?s theorem states that to avoid distortion or loss of
%information when sampling a signal, the sampling frequency must be 
%at least twice the highest frequency component of the signal. 
%If the sampling frequency is less than this, a phenomenon called 
%aliasing occurs, where high-frequency components are incorrectly 
%identified as lower frequencies, leading to a distorted, ?alias? signal.
%This minimum rate is known as the Nyquist rate.


% II
Fs = 50000;
Ts = 1/Fs;
n = 0:100;

x = sin(2*pi*2000*Ts*n); % Frequancy F_o = Ts * 2KHz = 0.04Hz
figure;
stem(n,x); title('x[n]');

y = x(1:2:101);
n = 0:2:100;
figure;
stem(n,y); title('y[n]'); 
% Signal is periodic with a period half of that of x[n] i.e., half the
% frequancy (0.02Hz)
