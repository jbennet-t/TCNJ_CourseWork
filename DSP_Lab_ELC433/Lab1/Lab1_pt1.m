%----------------------------------------------------------------------
%Create and visualize the harmonic series for a square wave with
%discrete-time sampling. 
%Signal Duration = 2 sec
%sampling frequency = fs = 8000Hz, Ts = 1/fs
%tone frequency = fo = 440Hz
Duration = 2; %Seconds t
fo = 440; %Hz 
fs = 8000; %Hz
Ts = 1/fs; %period 

plot_len = int32(2*fs/fo); %Nyquist limit

Sample_Time_Vector = 0:Ts:Duration;

%-----------------
%Dense sampling 
dense_fs = 80000;
dense_Ts = 1/dense_fs;
dense_STV = 0:dense_Ts:Duration;
dense_plot_len = int32(2*dense_fs/fo);
%----------------

for harmonics = 1:4:13
    y = sin(2*pi*fo*Sample_Time_Vector);
    y_80k = sin(2*pi*fo*dense_STV);

    for i=3:2:harmonics %harmonics
        y = y + sin(2*pi*fo*Sample_Time_Vector*i)/i; %create sin wave
        y_80k = y_80k + sin(2*pi*fo*dense_STV*i)/i; %create 80k hz dense sin wave
        
    
    figure(i)
    stem(Sample_Time_Vector,y)
    xlim([0 1/100]);
    hold on
    plot(dense_STV,y_80k)
    hold off
    xlim([0 1/100]);
    ylim([-2 2]);
    title(strcat(num2str(i),' Harmonic'));
    xlabel('Time');
    ylabel('Signal Value');
    sound(y,fs) %play sound
    pause
     
    
    end
    

end

