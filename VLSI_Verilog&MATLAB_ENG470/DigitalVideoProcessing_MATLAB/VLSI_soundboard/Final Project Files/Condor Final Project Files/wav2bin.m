%% wav2bin

wavdata = audioread('Guitar#1.wav');
int_wavdata = int16(round(wavdata*32767));
outfile = fopen('Guitar_int.txt', 'w');
fprintf(outfile, '%d\n',int_wavdata(:,1));
fclose(outfile);
figure(1);
plot(int_wavdata);

% fid=fopen('Guitar_intout.txt');
% C = textscan(fid, '%s');
% C=C{1};
% A = str2double(C);
% figure(2);
% plot(A);

%wavbinary = dec2bin( typecast( single(wavdata(:)), 'uint16'), 16 ) - '0';
%writetable(wavbinary, 'Guitar_bin.txt')

% orig_size = size(wavdata);
% wav = reshape( typecast( bin2dec( uint8(wavbinary + '0') ), 'single' ), orig_size );