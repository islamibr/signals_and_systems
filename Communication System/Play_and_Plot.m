function Play_and_Plot(y, Fs, title_str)
    % Play the audio file
    sound(y, Fs);

    % Plot the sound file in time domain
    Ts = (0:length(y)-1) / Fs;
    figure;
    subplot(3,1,1);
    plot(Ts, y);
    title(title_str);
    xlabel('Time (s)');
    ylabel('Amplitude');

    % Plot the sound file in frequency domain
    F_Axis = linspace(-Fs/2, Fs/2, length(y));
    Y = fftshift(fft(y));

    subplot(3,1,2);
    plot(F_Axis, abs(Y));
    title('Frequency Domain');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');

    subplot(3,1,3);
    plot(F_Axis, angle(Y));
    title('Frequency Domain');
    xlabel('Frequency (Hz)');
    ylabel('Phase');
end