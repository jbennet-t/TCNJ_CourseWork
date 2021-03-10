clear all
close all

PIC_WID  = 640     % Standard high-definition picture width
PIC_HGT  = 360     % Standard high-definition picture height
N_FRAMES = 90       % Three seconds, at 30 fps

MAX_RAD = sqrt((PIC_WID/2)^2 + (PIC_HGT/2)^2);

picture = zeros(PIC_HGT,PIC_WID,3);

for t = 0:(N_FRAMES-1)                                              % t will be frame index
    for y = 1:PIC_HGT                                               % y is image matrix row index
        for x = 1:PIC_WID                                           % x is image matrix column index
            
            r = sqrt((x-PIC_WID/2)^2 + (y-PIC_HGT/2)^2);            % r is the radius from the center of the image, maximum value is about 1100
            r = r * 2 * pi()/MAX_RAD;                               % r scaled from 0 to 2pi
            r = exp(r);                                             % exp(r) is linear for relatively small values of r, but grows exponentially
                                                                    % by feeding this as argument to sin(), get increasing frequency
            
            val = 0.5 + 0.5 * sin(r + t*pi()/10);                   % phase shift indexed by frame number, this gives apparent motion
            picture(y,x,1) = val;                                   % red is ampl
            picture(y,x,2) = 1/(r.^0.2);                            % interesting green based on radius
            picture(y,x,3)  = 1 - val;                              % blue is inverse of ampl
        end
    end
    %imshow(picture)                                                % uncomment to view
    imwrite(picture, sprintf( 'out_%03d.bmp', t ));                 % write out_ddd.bmp file
    t                                                               % print index t
end
