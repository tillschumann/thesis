import numpy as np
import matplotlib.pyplot as plt
import h5py
from mpl_toolkits.mplot3d.axes3d import Axes3D

from script_fcts import *

#
# python script to visualize an example voxel in a 3D plot
#
#

fig = plt.figure()
ax1 = fig.add_subplot(1, 1, 1, projection='3d')
ax1.set_title("all cell_body_positions")
ax1.set_xlabel("x")
ax1.set_ylabel("y")
ax1.set_zlabel("z")

h5_cell_body_positions = h5py.File("cell_body_positions.h5", "r")
x_positions = np.array(h5_cell_body_positions["x"])
y_positions = np.array(h5_cell_body_positions["y"])
z_positions = np.array(h5_cell_body_positions["z"])


y_positions_i = y_positions[x_positions<4500.0]
z_positions_i = z_positions[x_positions<4500.0]
x_positions_i = x_positions[x_positions<4500.0]

y_positions_ni = y_positions[x_positions>=4500.0]
z_positions_ni = z_positions[x_positions>=4500.0]
x_positions_ni = x_positions[x_positions>=4500.0]

#ax1.scatter(x_positions[own_voxel], y_positions[own_voxel], z_positions[own_voxel])
ax1.hold(True)
ax1.scatter(x_positions_ni[::5000], y_positions_ni[::5000], z_positions_ni[::5000])
ax1.scatter(x_positions_i[::5000], y_positions_i[::5000], z_positions_i[::5000], color='red')


plt.show()
