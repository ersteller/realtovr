import numpy as np
import cv2
import os

import flaskenv

img = cv2.imread('src/static/input_c4507f0b.jpg',0)
print(img)
#cv2.imshow('image',img )
#k = cv2.waitKey(0)
#if k == 27:         # wait for ESC key to exit
#    cv2.destroyAllWindows()
#elif k == ord('s'): # wait for 's' key to save and exit
outfile='src/static/output.png'
cv2.imwrite(outfile,img)
#cv2.destroyAllWindows()

newname = flaskenv.appendhash(outfile)
os.rename(outfile,newname)

