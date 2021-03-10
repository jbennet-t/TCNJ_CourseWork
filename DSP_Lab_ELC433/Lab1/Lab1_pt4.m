%Read in a sound file good_news.wav
%Read file and get sampling rate

[y, Fs]=audioread('good_news.wav');
y = y(:,1)'; % just keep left channel
                % transpose to row vector
y = y / max(y); % Normalize to max value of 1.0

NUM_SAMPS = length(y);

duration = NUM_SAMPS/Fs;

plot_indices = 29000:30499;

for div = 1:5:21
    fs_prime = Fs/div;
    sub_indices = 0:div:(NUM_SAMPS-1);
    plot_sub_indices = plot_indices(1:div:end);
    signal_prime = y(sub_indices+1);
    
    plot(plot_indices, y(plot_sub_indices));
    hold on
    stem(plot_sub_indices,y(plot_sub_indices)); %print stem plot of signal
    hold off
    
    title(' Good News ')
    xlim([plot_indices(1) plot_indices(end)]);
    ylim([-2 2]);
    xlabel( 'Sample Index' );
    drawnow
    
    sound(signal_prime,fs_prime)
    pause(duration)
    pause
end
    
    