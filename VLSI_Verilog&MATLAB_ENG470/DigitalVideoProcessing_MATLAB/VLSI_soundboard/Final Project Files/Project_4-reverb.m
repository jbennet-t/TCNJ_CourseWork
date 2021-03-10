[x, Fs] = audioread('Guitar_101.wav'); %importing audio file
sound(x,Fs); %Playing audio file
 
%Reverb Part
%Pause for sound to play
pause(5);
%Reverb delay components
delay_reverb_1 = 0.05;
delay_reverb_2 = 0.009;
delay_reverb_3 = 0.06;
%Multiplication coefficient for loss of sound strength from distance
alpha_reverb = 0.6;
%Multiplications of components by the sample rate
D_reverb_1 = delay_reverb_1*Fs;   
D_reverb_2 = delay_reverb_2*Fs;
D_reverb_3 = delay_reverb_3*Fs;
%Rounding of values to create integers
D_reverb_1_final = round(D_reverb_1);
D_reverb_2_final = round(D_reverb_2);
D_reverb_3_final = round(D_reverb_3);
%Creation of filter numerator coefficients
b_reverb = [1,zeros(1,D_reverb_1_final),alpha_reverb];
c_reverb = [1,zeros(1,D_reverb_2_final),alpha_reverb];
d_reverb = [1,zeros(1,D_reverb_3_final),alpha_reverb];
%Cascading of filters to create reverb effect
y_reverb = filter(b_reverb,1,x);
z_reverb = filter(c_reverb,1,y_reverb);
reverb_3 = filter(d_reverb,1,z_reverb);
sound(z_reverb,Fs);

%Pause for sound to play
pause(5);
%Data from Verilog to data to play in MATLAB
soundIn = fopen('Guitar_int_out_4.txt');
C = textscan(soundIn, '%s');
C = C{1};
A = str2double(C);
Amax = max(A);
sound(A/32767,Fs);

%Plotting the Original sound, the Matlab sound, and the Verilog sound
figure(1)

subplot(3,1,1);
plot(x) %plot original
title('Original Guitar.wav');
xlabel('Time');
ylabel('Amplitude');

ylim([-0.5 0.5])
subplot(3,1,2);
plot(z_reverb) %plot distorted signal
title('MATALB Reverb Guitar.wav');
xlabel('Time');
ylabel('Amplitude');

ylim([-0.5 0.5])
subplot(3,1,3);
plot(A/(32767)) %plot distorted signal
title('Verilog Reverb Guitar.wav');
xlabel('Time');
ylabel('Amplitude');
ylim([-0.5 0.5])

filename1 = 'Guitar_reverb_verilog.wav';
audiowrite(filename1,(A/32767),Fs,'BitsPerSample',16); %outputting verilog Reverb audio

filename2 = 'Guitar_reverb_matlab.wav';
audiowrite(filename2,z_reverb,Fs,'BitsPerSample',16); %outputting MATLAB Reverb audio
