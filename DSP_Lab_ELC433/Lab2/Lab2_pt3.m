%part 3
%plotting function from part1 over the interval [0 2pi] with
%with sampling interval 0-1023

w = ((2*pi)/1024)* (0:1:1023);

%|X(e^jw)| frequency domain
Xf1 = 1./(sqrt(1.9025 - (1.9*(cos(w)))));


subplot(2,1,1);plot((0:1023)*2*pi/1024,abs(X)) % 2 subplots, stacked vert
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])        % set ticks to be pi-ish
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'}) % pi-ish labels
title('Xf(e^{j\omega})')                        % set title
ylim([0 20])                                    % set vertical axis limits
xlim([0 (2*pi)])                                % set horizontal axis limits

%part 4
x = alpha.^(1000*t*Ts);
N = 1024;
mag_dtft = fft(x,N);

subplot(2,1,2);plot((0:1023)*2*pi/1024,mag_dtft)
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'})
title('X(e^{j\omega})')
ylim([0 20])
xlim([0 (2*pi)])