import numpy as np
import lumicks.pylake as lk
import matplotlib.pyplot as plt
import scipy.optimize

file = lk.File("test_data/20230717_165003 Marker 27.h5")
file.force1x
file['Trap position']['1X']
force = file.force1x.data
trap_position = file['Trap position']['1X'].data

plt.figure()
plt.plot(trap_position-9, -force)
plt.ylabel("Force (pN)")
plt.xlabel("Trap position ($\mu$m)")
plt.title("Force vs Position")
plt.show()

np.savetxt('force.csv', force, delimiter=' ', fmt='%s')
np.savetxt('trap_position.csv', trap_position, delimiter=' ', fmt='%s')