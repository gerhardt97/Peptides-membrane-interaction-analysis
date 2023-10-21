# This code could be used for the analysis of membrane tether radius obtained from beads pulling.
# The goal is to export the photon counts corresponding to pixels. 
# This code reads the confocal scan file (.h5) which includes photon counts of Green channal.
# This code identifies the membrane tether radius during out-pulling experiment and exports the data correlating to this step as an excel file.

import numpy as np
import matplotlib.pyplot as plt
import lumicks.pylake as lk

file = lk.File("Scan.h5")
list(file.scans)  
scan = file.scans[str(list(file.scans)[0])]

plt.figure()
scan.plot(channel="rgb") 

# crop scan image for photon counts anaylsis
plt.figure()
scan[:, 25:200, 103:110].plot(channel="rgb") # Gets all frames cropped from Y = 26 to 200 and X = 104 to 110.
green = scan[:, 25:200, 103:110].get_image("green")  # Gets the photon count of the pixel in the cropped area (shape == (h, w))
print(np.shape(green)) # 75 pixels in Y, 7 pixels in X

# demonstrate how to sum all photon count of a single Y-line
print(green[0,:])
print(np.sum(green[0,:]))

sum_cropped = np.zeros(np.shape(green)[0])
for yy in range(np.shape(green)[0]):
    sum_cropped[yy] = np.sum(green[yy,:]) # This will sum each Y-line across their whole x-values
    # i.e the [75,7] 2D matrix will become a [75,1] matrix that contains the sum of all photon counts of the 7 x-values
    
# plot in the same orientation as the image
plt.plot(sum_cropped[::-1],np.arange(np.shape(green)[0]))
plt.xlabel('sum of photon counts across the whole X')
plt.ylabel('Y-Pixel number')

# plot in the horizontal orientation
plt.plot(np.arange(np.shape(green)[0]),sum_cropped)
plt.ylabel('sum of photon counts')
plt.xlabel('Y-Pixel number')

np.savetxt('Y-Pixel number.csv',np.arange(np.shape(green)[0]), delimiter=' ', fmt='%s')
np.savetxt('sum of photon counts.csv',sum_cropped, delimiter=' ', fmt='%s')
