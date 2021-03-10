load( 'filt_3300_48000_coeffs.mat' );   % Get lowpass filt coeffs in Num


[y, Fs]=audioread('good_news.wav');
y = y(:,1)'; % just keep left channel

yf = conv(y, Num, 'same');              % Lowpass filter to 1 KHz cutoff
yf = yf / max(y);                       % Normalize to max value of 1.0

impulse_resp = Num;
impulse_resp_len = length(impulse_resp);
num_padding = impulse_resp_len - 1;
lft_padding = floor(num_padding/2);
rgt_padding = num_padding - lft_padding;

y_pad = [ zeros(1,lft_padding), y, zeros(1,rgt_padding) ]; % pad with zeros
                                                          
num_samples = length(y); % Get the # of samps
yf1 = zeros(1, num_samples); % result, starts with zeroes
                                                           
for n=1:num_samples
    yf1(n) = flip(impulse_resp) * y_pad(n:n+num_padding)';
end

yf1 = yf1 / max(yf1); 

fprintf("Max difference of yf1 vs. conv() function: %g\n", max(abs(yf-yf1)));