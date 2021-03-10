close all
clear 

[z, Fs] = audioread('Guitar_101.wav'); %importing audio file
filename = 'Guitar_downsample.wav';
audiowrite(filename,z,Fs,'BitsPerSample',16); %downsampling original file to 16bit audio
clear z Fs
[z, Fs] = audioread('Guitar_downsample.wav'); %reading in downsampled audio

z = z(:,1); %seperating out column 1 from the audio read
zMax = max(z); %calc max of input audio
zNormalized = z/zMax; %scale input audio to (-1,1) range
distort_level = 11; %set level of distortion

filename2 = 'Guitar_downsample_normalized.wav';
audiowrite(filename2,zNormalized,Fs,'BitsPerSample',16); %outputting normalized downsampled audio

int_wavdata = int16(zNormalized*32767); %converting normalized signal to signed 16 bit integer
outfile = fopen('Guitar_float.txt', 'w'); 
fprintf(outfile, '%d\n',int_wavdata(:,1)); %writing data to text file
fclose(outfile);

% figure(1)
% subplot(2,1,1);
% plot(z) %plotting base audio signal
% subplot(2,1,2);
% plot(zNormalized) %plotting normalized audio signal

N = length(zNormalized); %find length of audio
z_atan = 1:N; %create array

for i = 1:N
    z_atan(i) = (atan(distort_level*(zNormalized(i))))/(pi/2); %apply arctan
end

z_atanMax = max(z_atan); %calc max of z_atan
soundScale = zMax/z_atanMax; %val to normalize the volume

figure(2)
subplot(2,1,1);
plot(z) %plot original
title('Original Guitar.wav');
xlabel('Time');
ylabel('Amplitude');
subplot(2,1,2);
plot(z_atan*soundScale) %plot distorted signal
title('Ideal Distorted Guitar.wav');
xlabel('Time');
ylabel('Amplitude');

sound(z,Fs) %playing original signal
pause(9); %pause 
sound((z_atan*soundScale),Fs) %playing distorted signal

filename3 = 'Guitar_distorted.wav';
audiowrite(filename2,(z_atan*soundScale),Fs,'BitsPerSample',16); %outputting ideal distorted sound
