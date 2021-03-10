close all
clear 

%----------------Generating Look Up Table----------------------------------
distort_level = 11; %amount of distortion
LUT_vals = 1:512; %2^10 / 2

for i = 0:511
    LUT_vals(i+1) = (atan(distort_level*(i/511)))/(pi/2); %apply arctan
end

txtFile = fopen('LUT.v','w'); %opening txt file to write
for i = 0:511
    fprintf(txtFile,'9''h%03X : temp = 16''h%04X;\n', i, int16(32767*LUT_vals(i+1)));
end %converting LUT data to 16'h and adding 9'h increment #
fclose(txtFile);
