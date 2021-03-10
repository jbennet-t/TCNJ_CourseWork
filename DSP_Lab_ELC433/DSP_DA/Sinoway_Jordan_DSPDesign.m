%DSP 423 Filter Design Assignment
%11/30/20
%Jordan Sinoway
%sampling rate @ 1khz
%frequencies above 420Hz must be suppresed with transition bandwidth
%of 20Hz (410-430)
%filter must have linear phase with  anequiripple  passband  with  maximum  ripple  of  0.01  
%and  an  equiripple  stop-band with maximum ripple of 0.1
%frequencies below 50hz must be suppressed with a stopband attenuation of
%50db and a max passband ripple of 2dB, a stopdband edge frequency of 40Hz
%and a passband edge frequency of 60Hz
%-----------------------------INPUT SIGNAL-----------------------------
Ft = 1000; %sample rate in hz
signal_length = 2; %signal length in seconds
num_samples = signal_length*Ft; %total samples
t = (0:1:num_samples-1);

%combinging components of input signal
x = cos(2*pi*20*t/Ft)+cos(2*pi*40*t/Ft)+cos(2*pi*75*t/Ft)+cos(2*pi*100*t/Ft)+cos(2*pi*200*t/Ft);
x = x+cos(2*pi*300*t/Ft)+cos(2*pi*350*t/Ft)+cos(2*pi*440*t/Ft)+cos(2*pi*460*t/Ft)+cos(2*pi*475*t/Ft);

figure(1) %plot x
subplot(2,1,1)
stem(t,x,'filled','MarkerSize',2)
xlabel('Index')
title('Input signal, x')% title the figure

x_fft = fft(x);  % fft of input to show frequency
freq = (0:num_samples-1)*(Ft/num_samples); % converting bin number to frequency

subplot(2,1,2) %plotting fft of x
stem(freq,abs(x_fft),'filled','MarkerSize',2 ) %take abs
xlabel('Hz')
title('Frequency Components of x')
xlim([0 500]) 


%-----------------------------LOW PASS FILTER-----------------------------
Fp = 410; %Passband edge in Hz
Fs = 430; %stopband edge
Ft = 1000; %sampling frequency
Ap = 20*log10(sqrt(1+((0.01)^2))); %equripple max passband ripple 
As = 20*log10(0.1); %equripple max stopband ripple

wp = 2*pi*(Fp/Ft); %normalized passband edge
ws = 2*pi*(Fs/Ft); %normalized stopband edge

delta_p = (10^(Ap/20)-1)/(10^(Ap/20)+1); 
delta_s = (1+delta_p)/(10^(As/20)); %attenuations

[N,fo,mo,W] = firpmord( [Fp Fs], [1 0],[0.01 0.1], Ft); 
% ^ Parks-McClellan optimal FIR filter order estimation
disp('FIR Lowpass Filter Order N = ')
disp(N)

lp_filter = firpm(N,fo,mo,W); %Computing the lp filter

%impulse response
impulseResponseTest = zeros(1,num_samples); %zero fill
impulseResponseTest(1) = 1; %creating single pulse
impulse_rep_lpf = filter(lp_filter,1,impulseResponseTest); %applying filter to impulse

%amplitude response
[H,w] = freqz(lp_filter,1); %compute the amplitude response


%plotting LPF reponses
figure(2)
subplot(3,1,1) %plot Low Pass filter Impulse response
stem(t,impulse_rep_lpf,'filled','MarkerSize',2)
xlabel('Index')
xlim([1 70])
title('Low Pass Filter Impulse Response')

subplot(3,1,2) %plot Low Pass filter amplitude response
plot((w.*(Ft/6.24)),abs(H)) %abs to show amp
xlabel('Hz')
ylabel('Amplitude')
title('Low Pass Filter Amplitude Response')
xlim([1 500])

subplot(3,1,3) %plot Low Pass filter log magnitude response
plot((w.*(Ft/6.24)), db(H)) %convert to db to show log mag
xlabel('Hz')
ylabel('Magnitude in dB')
title('Low Pass Filter Log Magnitude Response')
xlim([1 500])

%--------------------------------------------------------------------------

%-----------------------------HIGH PASS FILTER-----------------------------
Fp_HP = 60; %Passband edge in Hz
Fs_HP = 40; %stopband edge
Ft = 1000; %sampling frequency
Ap_HP = 2; %dB, max passband ripple 
At = 50; %dB, stopband attentuation

wp_HP = 2*pi*(Fp_HP/Ft); %normalized passband edge
ws_HP = 2*pi*(Fs_HP/Ft); %normalized stopband edge

delta_p_HP = (10^(Ap_HP/20)-1)/(10^(Ap_HP/20)+1); 
delta_s_HP = (1+delta_p_HP)/(10^(At/20)); %attenuations

[N_HP,fo_HP,mo_HP,W_HP] = firpmord( [Fs_HP Fp_HP],[0 1],[delta_s_HP delta_p_HP], Ft); 
% ^ Parks-McClellan optimal FIR filter order estimation
disp('FIR Highpass Filter Order N = ')
disp(N_HP)

hp_filter = firpm(N_HP,fo_HP,mo_HP,W_HP); %Computing the hp filter


%impulse response
impulse_rep_hpf = filter(hp_filter,1,impulseResponseTest); %applying filter to impulse

%amplitude response
[H_HP,w_HP] = freqz(hp_filter,1); %compute the amplitude response


%plotting HPF reponses
figure(3)
subplot(3,1,1) %plot High Pass filter Impulse response
stem(t,impulse_rep_hpf,'filled','MarkerSize',2)
xlabel('Index')
xlim([1 80])
title('High Pass Filter Impulse Response')

subplot(3,1,2) %plot High Pass filter amplitude response
plot((w_HP.*(Ft/6.24)),abs(H_HP)) %abs to show amp
xlabel('Hz')
ylabel('Amplitude')
title('Low Pass Filter Amplitude Response')
xlim([1 500])

subplot(3,1,3) %plot Low Pass filter log magnitude response
plot((w_HP.*(Ft/6.24)),db(H_HP)) %convert to db to show log mag
xlabel('Hz')
ylabel('Magnitude in dB')
title('High Pass Filter Log Magnitude Response')
xlim([1 500])
%--------------------------------------------------------------------------

%-----------------------------COMBINED FILTER-----------------------------
%applying Low pass to input signal x
y = filter(lp_filter,1,x); 

%applying High pass to post LPF signal y
z = filter(hp_filter,1,y); 

z_fft = fft(z); % fft of input to show frequency
freq = (0:num_samples-1)*(Ft/num_samples); % converting bin number to frequency

%plotting z (output signal)
figure(4)
subplot(2,1,1)
stem(t,z,'filled','MarkerSize',2)
xlabel('Index')
title('Filter Output for z[n]')

subplot(2,1,2);
stem (freq,abs(z_fft),'filled','MarkerSize',2 )
xlabel('Frequency(Hz)')
title('Frequency Components of Filter Output')
xlim([0 max(f)/2]) 