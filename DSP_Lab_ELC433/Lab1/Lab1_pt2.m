%Create a single sampled sine wave. You will then subsample it via
%decimation, at different factors
duration = 2; %seconds
fs = 48000; %Hz, initial sampling frequency
fo = 1000; %Hz, tone frequency
Ts = 1/fs; %period
t = 0:Ts:duration;

%sampling_times = 0:(duration*fs-1)/fs; %vector representing sampling times for the specifed duration

y = sin(2*pi*fo*t); %equation for the signal

num_samples = length(y);
plot_indices = 1:500; %set graph indices 

for div = 1:5:31
    sub_indices = 0:div:(num_samples-1);
    plot_sub_indices = plot_indices(1:div:end);
    
    signal_new = y(sub_indices+1);
    plot(plot_indices-1,y(plot_indices)) %plot of original signal
    hold on
    stem(plot_sub_indices-1,y(plot_sub_indices)); %stem plot for sampling at division
    hold off
    drawnow
    
    fs_new = fs/div;
    
    xlim( [(plot_indices(1)-1) (plot_indices(end)-1)] );
    ylim([-2 2]);
    freq_string = sprintf('Tone frequency: %d Hz', fs_new);
    title(freq_string)
    xlabel('Sample Index');
    
    sound(signal_new,fs_new)
    pause(duration)
    pause
end
    
    