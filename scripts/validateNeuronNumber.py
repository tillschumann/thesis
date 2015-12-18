import h5py
import numpy as np

fs = h5py.File('/home/schumann/clusters/bgq-scratch/syn.h5')
fn = h5py.File('/home/schumann/clusters/csaba/HighD/tillTMP/big/ptneu_brain.h5')


excitatory = np.array(fn['excitatory'])

neurons = np.array(range(0,len(excitatory)))


ex_neurons = neurons[excitatory==1]


source_n = np.array(fs['neuron']['id'])

print len(source_n)
print len(ex_neurons)
print len(np.setdiff1d(source_n, ex_neurons))
print len(np.setdiff1d(ex_neurons,source_n))

fn.close()
fs.close()

