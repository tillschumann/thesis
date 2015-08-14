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
ax1 = fig.add_subplot(1, 3, 1, projection='3d')
ax1.set_title("all cell_body_positions in voxel")
ax1.set_xlabel("x")
ax1.set_ylabel("y")
ax1.set_zlabel("z")

h5_connectome = h5py.File("connectome_small.h5", "r")


h5_cell_body_positions = h5py.File("cell_body_positions_small.h5", "r")
x_positions = np.array(h5_cell_body_positions["x"])
y_positions = np.array(h5_cell_body_positions["y"])
z_positions = np.array(h5_cell_body_positions["z"])


#x_filter = np.logical_and(13100<x_positions, x_positions<131200)
#y_filter = np.logical_and(6800<y_positions, y_positions<6900)
#own_voxel = np.logical_and(x_filter,y_filter)
own_voxel = x_positions>0


ax1.scatter(x_positions[own_voxel], y_positions[own_voxel], z_positions[own_voxel])


ax2 = fig.add_subplot(1, 3, 2, projection='3d')
ax2.set_title("only connectome cell_body_positions in voxel")
ax2.set_xlabel("x")
ax2.set_ylabel("y")
ax2.set_zlabel("z")
if True:
  neurons_in_voxel=np.array([], dtype=int)
  for item in h5_connectome.keys():
    h5_dataset = h5_connectome[item]
    neurons_in_voxel = np.append(neurons_in_voxel,np.array(h5_dataset[0]))

  ax2.scatter(x_positions[neurons_in_voxel], y_positions[neurons_in_voxel], z_positions[neurons_in_voxel])
  #plt.show(block=False)
    #raw_input("Ploted voxel %s continue.." %item)




  # print neurons_in_voxel.shape


  #check if diff always greater than zero
  #neuron_id_diff=(neurons_in_voxel[2:len(neurons_in_voxel)]-neurons_in_voxel[1:len(neurons_in_voxel)-1])>0
  #check boundaries for optimization
  #l_boundary = np.min(neurons_in_voxel)
  #u_boundary = np.max(neurons_in_voxel)
  #print l_boundary
  #print u_boundary

  if True:
    
    ax3 = fig.add_subplot(1, 3, 3, projection='3d')
    
    len_h5_connectome = len(h5_connectome.keys())
    ci=0
    for item in h5_connectome.keys():
      ci=ci+1
      #progressbar(float(ci)/float(len_h5_connectome), 60)
      h5_dataset = h5_connectome[item]
      #h5_dataset = h5_connectome["068"]
      source_neuron_ids = np.array(h5_dataset[0])
      found = np.zeros(source_neuron_ids.shape)
      for row in h5_dataset[1:]:
	c=0
	for cell in row:
	  #if l_boundary < cell < u_boundary:
	  if cell in neurons_in_voxel:
	    found[c]=found[c]+1
	    ax2.plot([x_positions[source_neuron_ids[c]],x_positions[cell]],[y_positions[source_neuron_ids[c]],y_positions[cell]],[z_positions[source_neuron_ids[c]],z_positions[cell]])
	  c=c+1
      #size = [(item+1)*10 for item in found]
      #print found>0
      tmp = source_neuron_ids[found>0]
      if len(tmp)>0:
	ax3.scatter(x_positions[tmp],y_positions[tmp],z_positions[tmp])
      #
    #print neurons_in_voxel[2:len(neurons_in_voxel)]-neurons_in_voxel[1:len(neurons_in_voxel)-1]
    #
    #

plt.show(block=True)

