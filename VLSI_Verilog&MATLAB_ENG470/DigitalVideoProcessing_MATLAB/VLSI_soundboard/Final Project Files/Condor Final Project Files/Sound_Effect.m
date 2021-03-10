 close all;  
 clear
 %% Guitar_Sound 
 [x,Fs] = audioread('Guitar#1.wav');  
 sound(x,Fs);  
 pause(10);             % wait 10ms
 delay = 0.2;           % 0.2s delay  
 alpha = 0.99;          % echo strength  
 D = delay*Fs;          
 y = zeros(size(x));    %Set a zero-y with the size of x
 y(1:D) = x(1:D);       %Set first 1 to D elements in y to x
 
 for i=D+1:length(x)    %Combine the original one with the effect one
   y(i) = x(i) + alpha*x(i-D);  
 end  
   
 %% using filter method.  
 % b = [1,zeros(1,D),alpha];  
 % y = filter(b,1,x);  
   
 %% echoed guitar Chorus  
sound(y,Fs);
pause(10); 
 
fid=fopen('Guitar_int_out_11.txt');
C = textscan(fid, '%s');
C=C{1};
A = str2double(C);
%% verilog version
sound(A/32767,Fs);


figure(1)
subplot(3,1,1);
plot(x) %plot original
title('Original Guitar.wav');
xlabel('Time');
ylabel('Amplitude');
ylim([-0.5 0.5]);

subplot(3,1,2);
%plot(z) %plot original
plot(y) %plot ideal
title('Ideal echoed Guitar.wav');
xlabel('Time');
ylabel('Amplitude');
ylim([-0.5 0.5]);

subplot(3,1,3);
plot(A/(32767)) %plot distorted signal
title('Verilog echoed Guitar.wav');
xlabel('Time');
ylabel('Amplitude');
ylim([-0.5 0.5]);

filename = 'Guitar_echoed_matlab.wav';
audiowrite(filename,(y),Fs,'BitsPerSample',16); %outputting verilog echoed audio
filename1 = 'Guitar_echoed_verilog.wav';
audiowrite(filename1,(A/32767),Fs,'BitsPerSample',16); %outputting verilog echoed audio