%Short-Time Fourier Transform
%SEGMENT_LENGTH = 1024
%OFFSET_PER_SEGMENT = 0.5 50%
%FFT_LENGTH = 4096
[x,Fs] = audioread('la_la_land.m4a');
x = x(:,1);

SEGMENT_LENGTH = 1024;
OFFSET_PER_SEGMENT = 512;
FFT_LENGTH = 4096;
%i = 1;
seg = 1;

for i = 1 : OFFSET_PER_SEGMENT : (SEGMENT_LENGTH*100)

        data = x(i:i+SEGMENT_LENGTH-1);
        data_fft = abs(fft(data, FFT_LENGTH));
        coeffs(:,seg) = data_fft;
        seg = seg + 1;

end

figure(2)
surf(coeffs)
xlim([1 seg])
ylim([1 400])
xlabel('Segment #')
ylabel(sprintf('Frequency Bin, Total %d Bins, Sampling rate = %d KHz', FFT_LENGTH, Fs/1000));
title('Short-Time Fourier Transform');

%spectrogram(x,SEGMENT_LENGTH,512,FFT_LENGTH,Fs);

