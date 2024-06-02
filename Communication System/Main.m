%% Load the audio file
[y, Fs] = audioread('ringtone.mp3');

% Play and plot the original signal
Play_and_Plot(y, Fs, 'Original Signal');

%% Prompt user to choose channel impulse response
channel_impulse_response = input('Choose a response: \n1. Delta function\n2. exp(-2pi*5000t)\n3. exp(-2pi*1000t)\n4. Custom impulse response\n ', 's');

switch channel_impulse_response
    case '1'
        % Delta function
        H = [1 zeros(1, length(y) - 1)];
    case '2'
        % Exponential decay response with a frequency of 5000 Hz
        t = (0:length(y)-1) / Fs;
        H = exp(-2 * pi * 5000 * t);
    case '3'
        % Exponential decay response with a frequency of 1000 Hz
        t = (0:length(y)-1) / Fs;
        H = exp(-2 * pi * 1000 * t);
    case '4'
        % Custom impulse response (adds some distortion to the signal)
        H = [2 zeros(1, 1 * Fs - 2) 1];
    otherwise
        error('Invalid impulseResponse value. Choose from 1 to 4.');
end

% Ensure y and H are vectors
y = y(:);  % Convert y to a column vector
H = H(:);  % Convert H to a column vector

% Apply channel impulse response and play/plot the modified signal
x = conv(y, H);
Play_and_Plot(x, Fs, 'Modified Signal');

%% Add Gaussian noise and play/plot the noisy signal
sigma = str2double(input('Enter Standard deviation of the Gaussian noise: ', 's'));
z = sigma * randn(size(x));
y_noisy = x + z;
Play_and_Plot(y_noisy, Fs, 'Noisy Signal');

%% Apply band-pass filter and play/plot the signal
right_band = round((Fs / 2 - 3400) * (length(y_noisy) / Fs));
left_band = (length(y_noisy) - right_band + 1);
Y_noisy = fftshift(fft(y_noisy));
Y_noisy([1:right_band left_band:length(y_noisy)]) = 0;
y_filtered = real(ifft(ifftshift(Y_noisy)));
Play_and_Plot(y_filtered, Fs, 'Filtered Signal');

%% Extract the audio file
audiowrite('result.wav', y_filtered, Fs);