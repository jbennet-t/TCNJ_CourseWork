close all
clear 

[z, Fs] = audioread('Guitar_downsample.wav');
sound(z,Fs) %playing original signal
zMax = max(z); %calc max of input audio
%pause(9); %pause

soundIn = fopen('Guitar_int_out.txt');
C = textscan(soundIn, '%s');
C = C{1};
A = str2double(C);
Amax = max(A);
% soundScale = zMax/Amax; %val to normalize the volume

sound(A/32767,Fs);

figure(1)
subplot(2,1,1);
%plot(z) %plot original
plot(z_atan) %plot ideal
title('Ideal Distorted Guitar.wav');
xlabel('Time');
ylabel('Amplitude');

ylim([-1 1])
subplot(2,1,2);
plot(A/(32767)) %plot distorted signal
title('Verilog Distorted Guitar.wav');
xlabel('Time');
ylabel('Amplitude');


filename1 = 'Guitar_distorted_verilog.wav';
audiowrite(filename1,(A/32767),Fs,'BitsPerSample',16); %outputting verilog distorted audio