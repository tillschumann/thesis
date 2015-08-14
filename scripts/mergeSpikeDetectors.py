import numpy as np
import csv
import matplotlib.pyplot as plt
from os import listdir


data=np.array(np.zeros(2289097),dtype=object)
neurons = np.zeros(2289097).astype('int32')


data_i=0

non=71000000
MPI_COMM_SIZE=1024
RANK=872

cn=0

for f in listdir('nest_output5'):
  if 'spike' in f:
    print f
    traceFile=csv.reader(open('nest_output5/%s'%f,"rb"),delimiter='\t')


    x=np.array(list(traceFile))
    
    neuron_ = []
    timestamp_ = []
    for l in x:
      if len(l)>2:
	neuron_.append(l[0])
	timestamp_.append(l[1])

    neuron_=np.array(neuron_).astype('int32')
    timestamp_ = np.array(timestamp_).astype('float')

    n_id_file=np.unique(neuron_)

    data_file=[]


    for i in range(0,len(n_id_file)):
      data_file.append([])

    for i in range(0,len(neuron_)):
      data_file[np.where(n_id_file==neuron_[i])[0][0]].append(timestamp_[i])
    
    for i in range(0,len(n_id_file)):
      data[data_i+i] = np.array(data_file[i])
      neurons[data_i+i] = n_id_file[i]
    data_i += len(n_id_file)

np.save('neurons', neurons)
np.save('spikes', data)

print data_i
