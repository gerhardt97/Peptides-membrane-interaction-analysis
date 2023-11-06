# This code could be used for the analysis of the membrane tether force obtained from beads pulling.
# The goal is to export the force corresponding to the trap position of the experiment. 
# This codes reads the force measurement file (.h5) which includes trap position parameter of Trap 1.
# This code identifies the membrane tether out-pulling experiment and exports the data correlating to this step as an excel file.

import numpy as np
import lumicks.pylake as lk
import matplotlib.pyplot as plt

file = lk.File("Marker from Bluelake.h5")
file.force1x
file['Trap position']['1X']

force = file.force1x.data
force_downsampled = file.force1x.downsampled_by(1000).data
trap_position = file['Trap position']['1X'].data
trap_position_downsampled = file['Trap position']['1X'].downsampled_by(1000).data

plt.figure()
plt.plot(trap_position_downsampled, -force_downsampled) # "-" means Trap 1 located at right site of GUVs and moved towards east.
plt.show()

np.savetxt('force.csv', force_downsampled, delimiter=' ', fmt='%s')
np.savetxt('trap_position.csv', trap_position_downsampled, delimiter=' ', fmt='%s')
