#attempt to animate moving objects and text using
#Jordan Sinoway - 1/29/2020

import cv2
import numpy as np

PIC_WID  = 640     # Standard high-definition picture width
PIC_HGT  = 360     # Standard high-definition picture height
N_FRAMES =  5       # Three seconds, at 30 fps

MAX_RAD = np.sqrt((PIC_WID/2)**2.0 + (PIC_HGT/2)**2.0)

#picture = np.zeros( (PIC_HGT,PIC_WID,3) )  #makes background black

for t in range(N_FRAMES):                                               # t will be frame index
    picture = np.zeros((PIC_HGT, PIC_WID, 3))  # makes background black
    for y in range( PIC_HGT ):                                          # y is image matrix row index
        for x in range ( PIC_WID ):                                     # x is image matrix column index


            # r = np.sqrt((x-PIC_WID/2)**2.0 + (y-PIC_HGT/2)**2.0)       # r is the radius from the center of the image, maximum value is about 1100
            # r = r * 2.0 * np.pi/MAX_RAD                                # r scaled from 0 to 2pi
            # r = np.exp(r)                                              # exp(r) is linear for relatively small values of r, but grows exponentially
                                                                        # by feeding this as argument to sin(), get increasing frequency
            
            #val = 0.5 + 0.5 * np.sin(2 + t*np.pi/10)                   # phase shift indexed by frame number, this gives apparent motion
            #picture[y,x,0] = val                                       # red is ampl
            #picture[y,x,1] = 1.0/(r**0.2)                              # interesting green based on radius
            #picture[y,x,2]  = 1.0 - val                                # blue is inverse of ampl
            


            cv2.rectangle(picture, (((t * 100) + 10), ((t * 100) + 10)), (((t * 100) + 10), ((t * 100) + 10)), (0, 100, 0),10)

            cv2.rectangle(picture, (224, 0), (510, 128), (0, 0, 100), 3)


            font = cv2.FONT_HERSHEY_SIMPLEX
            bottomLeftCornerOfText = (t* 50, 150)
            fontScale = 1
            fontColor = (100, 220, 140)
            lineType = 2

            cv2.putText(picture, 'This is supposed to be interesting',
                        bottomLeftCornerOfText,
                        font,
                        fontScale,
                        fontColor,
                        lineType)


    fn = 'out_%03d.bmp' % t 
    po = picture * 255                                                  # CV2 expects images to be scaled to range [0,255]
    po = po.astype(np.uint8)                                            # Convert from float64 to uint8
    po = cv2.cvtColor(po, cv2.COLOR_RGB2BGR)                            # default for OpenCV is BGR
    cv2.imwrite(fn, po)                                                # write out_ddd.bmp file, default for OpenCV is BGR
