import cv2
import numpy as np

PIC_WID  = 640     # Standard high-definition picture width
PIC_HGT  = 360     # Standard high-definition picture height
N_FRAMES =  2      # Three seconds, at 30 fps

MAX_RAD = np.sqrt((PIC_WID/2)**2.0 + (PIC_HGT/2)**2.0)
picture = np.zeros((PIC_HGT, PIC_WID, 3))  # makes background black

for t in range(N_FRAMES):                                               # t will be frame index
    for y in range( PIC_HGT ):                                          # y is image matrix row index
        for x in range ( PIC_WID ):                                     # x is image matrix column index

            cv2.rectangle(picture, (384, 0), (510, 128), (0, 255, 0), 3)
            #cv2.rectangle(picture, (((t * 50) + 10), ((t * 50) + 10)), (((t * 50) + 10), ((t * 50) + 10)), (0, 255, 0),10)


    fn = 'out2_%03d.bmp' % t
    po = picture * 255                                                  # CV2 expects images to be scaled to range [0,255]
    po = po.astype(np.uint8)                                            # Convert from float64 to uint8
    po = cv2.cvtColor(po, cv2.COLOR_RGB2BGR)                            # default for OpenCV is BGR
    cv2.imwrite(fn, po)                                                # write out_ddd.bmp file, default for OpenCV is BGR
