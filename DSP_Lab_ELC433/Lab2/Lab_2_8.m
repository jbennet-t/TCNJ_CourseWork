%part 8
N = 256;
n = 0:(N-1);

y1 = sin((2*pi*n)/N);
y2 = sin((4*pi*n)/N);
y3 = sin((22*pi*n)/N);
y4 = sin((202*pi*n)/N);
y5 = cos((23*pi*n)/N);

Fy = fft(y5); % take the FFT
subplot(2,1,1) % stack 2 vertical, 1st
stem(0:(N/2-1),abs(Fy(1:N/2)),'filled',':diamondr','MarkerSize',2) % plot N-point FFT
xlim([0 128]) % set plot width
Fy_16 = fft(y5,N*16); % FFT with 4096 samples
subplot(2,1,2) % stack 2 vertical, 2nd
plot(0:(16*N/2-1),abs(Fy_16(1:16*N/2))) % line plot for detail
xlim([0 N*16/2]) % set plot width