n = linspace(0, pi, 200);
x = cos(n);
%fft_phase_shift
x_fft = fft(x);
x_fft_phase_shift = zeros(1, numel(n));
x_fft_phase_shift(1:100) = x_fft(101:200);
x_fft_phase_shift(101:200) = x_fft(1:100);
%fft_time_shift
x_ = x(7:200);
x_(195:200) = x(1:6);
x_fft_time_shift = fft(x_);

subplot(2,3,1);
stem(x)
title('Orignal Signal');
xlabel('Index');
ylabel('Magnitude');
subplot(2,3,2);
stem(abs(x_fft))
title('abs of FFT');
xlabel('Index');
ylabel('Magnitude');
subplot(2,3,3);
stem(angle(x_fft+0.0000000001))
title('Phase of FFT');
xlabel('Index');
ylabel('Magnitude');
subplot(2,3,4);
stem(x_)
title('Shifted Orignal Signal');
xlabel('Index');
ylabel('Magnitude');
subplot(2,3,5);
stem(abs(x_fft_time_shift))
title('abs of Shifted FFT Signal');
xlabel('Index');
ylabel('Magnitude');
subplot(2,3,6);
stem(angle(x_fft_time_shift+0.0000000001))
title('Phase of Shifted FFT Signal');
xlabel('Index');
ylabel('Magnitude');
