N = 200; %Number of samples
f1 = (10.5/N); %frequency 1
f2 = (16/N); %frequency 2

%-----------------Computing FFT-----------------------------------
samp_len = 0:1:(N-1); %sample length
normalized_freq = 2*pi*samp_len/N; %normalizing frequency
test_sig = cos(10.5*normalized_freq) + 0.01*cos(16*normalized_freq); %test signal comprised of 2 cos waves
fft_sig = fft(test_sig); %taking of fft of test signal
abs_fft = abs(fft_sig); %take absolute value of signal
fft_sig_db = 20*log10((abs_fft)); %convert to db
sig_max = max(fft_sig_db); %calc max
normalized_fft_sig = fft_sig_db - sig_max; %normalize

figure(1);
subplot(2,1,1);
stem(test_sig) %plot test signal
title('test signal');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
plot(samp_len, normalized_fft_sig) %plot normalized fft
title('FFT Magnitude vs. Bin #');
xlim([0 100])
ylim([-70 10])
xlabel('Index');
ylabel('Magnitude');

%-----------------Computing Triangle Window---------------------------
win1 = triang(length(test_sig)); %creating window 
win1 = win1'; %transposing because its a 200x1 double, must be 1x200 to mult
triwindowed_signal = (test_sig .* win1); %applying window to test sig
fft_tri = fft(triwindowed_signal); %taking fft
abs_fft_tri = abs(fft_tri); %taking abs val
tri_fft_sig_db = 20*log10((abs_fft_tri)); %convert to dB
tri_sig_max = max(tri_fft_sig_db); %calc max
normalized_tri_fft_sig = tri_fft_sig_db - tri_sig_max; %normalizing sig

%-----------------Computing Blackman-Harris Window---------------------------
win2 = blackmanharris(length(test_sig)); %creating window 
win2 = win2'; %transposing because its a 200x1 double, must be 1x200 to mult
bh_windowed_signal = (test_sig .* win2); %applying window to test sig
fft_bh = fft(bh_windowed_signal); %taking fft
abs_fft_bh = abs(fft_bh); %taking abs val
bh_fft_sig_db = 20*log10((abs_fft_bh));%convert to dB
bh_sig_max = max(bh_fft_sig_db); %calc max
normalized_bh_fft_sig = bh_fft_sig_db - bh_sig_max; %normalizing sig

figure(2);
subplot(2,1,1);
plot(normalized_tri_fft_sig)
title('Triangle Window'); %plotting normalized tri window
xlim([0 100])
ylim([-70 10])
xlabel('Index');
ylabel('Magnitude');

subplot(2,1,2);
plot(normalized_bh_fft_sig)
title('Blackman-Harris'); %plotting rect normalized BH window
xlim([0 100])
ylim([-70 10])
xlabel('Index');
ylabel('Magnitude');
