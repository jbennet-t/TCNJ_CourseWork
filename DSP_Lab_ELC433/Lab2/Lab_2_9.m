%part 9
N = 256;
n = 0:(N-1);

% y1 = sin((2*pi*n)/N);
% y2 = sin((4*pi*n)/N);
% y3 = sin((22*pi*n)/N);
% y4 = sin((202*pi*n)/N);
y5 = cos((23*pi*n)/N); % exactly 11.5 cycles

Fy = fft(y5); % take the FFT
figure

title('Superimpose');

stem(0:(N/2-1),abs(Fy(1:N/2)),'filled','MarkerSize',2,'Color','k') % plot N-point FFT
xlim([0 128]);  %set limit
ylim([0 150]);
ax1 = gca; % current axes
ax1.XColor = '#D95319';
ax1.YColor = '#D95319';
ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,'XAxisLocation','top','YAxisLocation','right','Color','none');

hold on
Fy_16 = fft(y5,N*16); % FFT with 4096 samples
plot(0:(16*N/2-1),abs(Fy_16(1:16*N/2)),'Parent',ax2,'Color','#ED8120')
xlim([0 N*16/2]);       %set limit
ylim([0 150]);

