clc
clear all
% initial parameters
sampling_freq = input('Enter the sampling frequency of the signal: ');
start_time = input('Enter the start time of the signal: ');
end_time = input('Enter the end time of the signal: ');
num_breakpoints = input('Enter the number of breakpoints: ');

breakpoints = zeros(1, num_breakpoints);
for i = 1:num_breakpoints
    breakpoints(i) = input(['Enter the position of breakpoint ',num2str(i), ': ']);
end

% Create time vector
t =start_time:(1 / sampling_freq):end_time;

% Generate signal for each region between breakpoints
signals = {};
for i = 1:(num_breakpoints + 1)
    if i == 1
        start_idx = 1;
    else
        start_idx = find(t == breakpoints(i - 1)) + 1;
    end
    
    if i == (num_breakpoints + 1)
        end_idx = length(t);
    else
        end_idx = find(t == breakpoints(i));
    end
    
    while true        
        signal_type = lower(input(['Enter the signal type for region ', num2str(i), ':\na. DC signal: Amplitude.\nb. Ramp signal: slope, intercept\nc. Polynomial: order,coefficients intercept\nd. Exponential signal: Amplitude, exponent \ne. Sinusoidal signal: Amplitude, frequency, phase\nf. Sinc function: Amplitude, center shift\ng. Triangle pulse: Amplitude, center shift, width\n > '], 's'));

        switch signal_type
            case 'a' %DC
                constant = input(['Enter the Value of DC: ']);
                signal = constant * ones(1, end_idx - start_idx + 1);
            case 'b' %Ramp
                slope = input(['Enter the slope of Ramp: ']);
                intercept = input(['Enter the intercept of the Ramp: ']);
                signal = slope * (t(start_idx:end_idx)) + intercept;
            case 'c' %Polynomial
                order = input(['Enter the order of polynomial: ']);
                intercept = input(['Enter the intercept of polynomial: ']);
                coefficients = zeros(1, order + 1);
                coefficients(end) = intercept;
                for j = order:-1:1
                    coefficients(j) = input(['Enter the coefficient of x^', num2str(order-(j-1)), ': ']);
                end
                signal = polyval(coefficients, t(start_idx:end_idx));
            case 'd' %Exponential
                Amplitude = input(['Enter the Amplitude of exponential: ']);
                exponent = input(['Enter the exponent of exponential: ']);
                signal = Amplitude * exp(exponent * t(start_idx:end_idx));
            case 'e' %Sinusoidal
                Amplitude = input(['Enter the Amplitude of sinusoidal: ']);
                frequency = input(['Enter the frequency of sinusoidal: ']);
                phase = input(['Enter the phase of sinusoidal: ']);
                signal = Amplitude * sin(2 * pi * frequency * t(start_idx:end_idx) + phase);
            case 'f' %Sinc
                amplitude = input('Enter the amplitude of the sinc function: ');
                center_shift = input('Enter the center shift of the sinc function: ');
                signal = amplitude * sinc(t(start_idx:end_idx) - center_shift);
            case 'g' %Triangle
                amplitude = input('Enter the amplitude of the triangle pulse: ');
                width = input('Enter the width of the triangle pulse: ');
                center_shift = input('Enter the center shift of the triangle pulse: ');
                signal = amplitude * (1 - abs(mod(t(start_idx:end_idx) - center_shift, width) - width/2) * (2/width));
            otherwise
                disp('Invalid signal type');
        end
        if ismember(signal_type,['a' 'b' 'c' 'd' 'e' 'f' 'g'])
            signals{i} = signal;
            break;
        end
    end
end

% Combine signals from all regions
combined_signal = [];
for i = 1:numel(signals)
    combined_signal = [combined_signal, signals{i}];
end

% Display the resulting signal
figure;
plot(t, combined_signal);
xlabel('Time');
ylabel('Amplitude');
title('Generated Signal');
grid on

% Preform Signal operations
while true
    operation = input('Choose an operation : \na. Amplitude Scaling\nb. Time Reversal\nc. Time Shift\nd. Expanding\ne. Compressing\nf. Clipping\ng. Derivative\nh. None\n > ', 's');
   
    switch lower(operation)
        case 'h'
            break;
        case 'a' %Amplitude Scaling
            scale_value = input('Enter the scale value: ');
            combined_signal = combined_signal * scale_value;
        case 'b' %Time reversal
            combined_signal = fliplr(combined_signal);
        case 'c' %Time shift
            shift_value = input('Enter the shift value: ');
            shifted_time = t - shift_value;
            combined_signal = combined_signal(t >= start_time & t <= end_time);
            t = shifted_time(t >= start_time & t <= end_time);
        case 'd' %Expanding
          expand_value = input('Enter the expand value: ');
          % Use interp1 with nearest neighbor for expanding
          new_t = t.*expand_value;
          combined_signal = combined_signal(t >= start_time & t <= end_time);
            t = new_t(t >= start_time & t <= end_time);
        case 'e' %Compressing
          compress_value = input('Enter the compress value: ');
          % Select indices for compressing (consider edge cases)
          new_t = t./compress_value;
          combined_signal = combined_signal(t >= start_time & t <= end_time);
            t = new_t(t >= start_time & t <= end_time);

        case 'f' %Clipping
            lower_clip = input('Enter the lower clipping value: ');
            upper_clip = input('Enter the upper clipping value: ');
            combined_signal = max(min(combined_signal, upper_clip), lower_clip);
        case 'g' %Derivative
            for i = 1:length(combined_signal) - 1
            % Right-sided difference
            combined_signal(i) = (combined_signal(i + 1) - combined_signal(i)) / (t(i + 1) - t(i));
            end
     
            % Handle the last point (no right neighbor)
            combined_signal(end) = 0;  % You can also extrapolate based on previous points
        otherwise
            disp('Invalid operation');
    end

    % Display the new signal
    figure;
    plot(t, combined_signal);
    xlabel('Time');
    ylabel('Amplitude');
    title('Modified Signal');
    grid on
end
