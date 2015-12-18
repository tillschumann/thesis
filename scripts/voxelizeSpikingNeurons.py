import h5py
import numpy as np


#Fsyn = h5py.File('/home/schumann/clusters/bgq-scratch/syn_short.h5')

neurons = np.array(np.load('/home/schumann/thesis/tmp/neurons.npy'))
Fn = h5py.File('/home/schumann/Desktop/ptneu_brain.h5')

v = np.zeros([133,81,115], dtype=np.int32)


#num_of_targets = np.uint64(Fsyn['neuron'][19]['syn_n'])
#start_id_targets = np.uint64(Fsyn['neuron'][19]['syn_ptr'])

#targets = np.array(Fsyn['syn'][start_id_targets:start_id_targets+num_of_targets]['target'])


print "start voxelizing"
print "number of neurons", len(neurons)
for n in neurons:
    n-=2
    x = (Fn['x'][n]+13300/2)/100
    y = (-1*Fn['y'][n]+8100/2)/100
    z = (Fn['z'][n]+11500/2)/100
    v[int(x),int(y),int(z)] += 1


vF = v.reshape(133*81*115, order='F')
vF.tofile("/home/schumann/thesis/tmp/spikingNeurons.raw")

Fn.close()





