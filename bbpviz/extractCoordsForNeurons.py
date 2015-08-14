import numpy as np
import csv
import matplotlib.pyplot as plt
from os import listdir
import h5py


neurons = np.load('neurons.npy')

n_coords = np.zeros([len(neurons), 3])


coord_f = h5py.File('../../../genBrain/cell_body_positions.h5','r')



for i in range(0, len(neurons)):
    n_coords[i,0] = coord_f['x'][neurons[i]-1]
print 'x done'
for i in range(0, len(neurons)):
    n_coords[i,1] = coord_f['y'][neurons[i]-1]
print 'y done'
for i in range(0, len(neurons)):
    n_coords[i,2] = coord_f['z'][neurons[i]-1]
print 'z done'


#np.save('coords', n_coords)
np.savetxt('circuit.mvd2', n_coords, fmt='0 0 0 0 0 0 0 %f %f %f 0 0')
