[x, Fs] = audioread('la_la_land.m4a'); %importing audio file
%sound(x,Fs)
x = x(:,1); %seperating out column 1 from the audio read

plot(x); %plotting base audio signal


signal_length = length(x);
scale_factor = 100000; %10^5
subSignal = x(0.3*scale_factor:1.3*scale_factor); %sub sample of the signal that's a "pretty big segment of good quality"

figure(1)
subSig_fft = abs(fft(subSignal)); %take FFT of sub sample of the signal
sub_Sig_len = length(subSignal); %new length for sub sample

[N,temp] = size(subSig_fft);

%full FFT values
subplot(3,1,1);
plot(0:sub_Sig_len-1,subSig_fft) % -1 to match vector length
title('High Quality Segment of Audio Signal FFT')
xlim([0 sub_Sig_len]);
xlabel('Index')
ylabel('Magnitude')

%half FFT values
subplot(3,1,2);
plot(0:sub_Sig_len-1,subSig_fft)
title('1/2 of HQS Audio Signal FFT')
xlim([0 sub_Sig_len/2]);
xlabel('Index')
ylabel('Magnitude')

%component at fundemental frequency
subplot(3,1,3);
plot(0:sub_Sig_len-1,subSig_fft)
title('Component of Fundamental Frequency')
%xlim([0 sub_Sig_len/16]);
xlim([0.008*scale_factor 0.028*scale_factor]);
%xlim([0.015*scale_factor 0.02*scale_factor]);
ylim([-4000 4000]);
xlabel('Index')
ylabel('Magnitude')

%calculating frequency from bins
k = 890;
fk = k/N * Fs