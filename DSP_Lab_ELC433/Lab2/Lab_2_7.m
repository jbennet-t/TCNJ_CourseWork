%part 7
N = 256;
n = 0:(N-1);

y1 = sin((2*pi*n)/N);
y2 = cos((4*pi*n)/N);
y3 = cos((22*pi*n)/N);
y4 = cos((202*pi*n)/N);

y = y1 + y2 + y3 + y4;
Fy = fft(y);

subplot(2,2,1) % stack 2 vertical, 1st
stem(n,abs(Fy),'filled','MarkerSize',2) % plot N-point FFT
xlim([0 N-1]) % set plot width
xlabel('n')
title('FFT abs graph(0:256)')

subplot(2,2,2);
stem(0:(N/2-1),abs(Fy(1:N/2)),'filled','MarkerSize',2) % plot N-point FFT
xlim([0 N/2-1])
xlabel('n')
title('FFT abs graph(0:128)')

subplot(2,2,3); % stack 2 vertical, 1st
plot(n,real(Fy(1:N))) % plot N-point FFT
xlim([0 N-1]) % set plot width
xlabel('n')
title('FFT Real components')

subplot(2,2,4);
plot(n,imag(Fy(1:N))) % plot N-point FFT
xlim([0 N-1])
xlabel('n')
title('FFT Imagine components')





