import numpy as np
import csv
import matplotlib.pyplot as plt



import matplotlib as mpl
import matplotlib.cm as cm
from matplotlib.patches import Polygon


traceFile=csv.reader(open("nest_output4/spike_detector-71000001-0800.gdf","rb"),delimiter='\t')


x=np.array(list(traceFile))

#neuron_ = np.array(x[:,0]).astype('int64')
#timestamp_ = np.array(x[:,1]).astype('float')

    
neuron_ = []
timestamp_ = []
for l in x:
  if len(l)>2:
    neuron_.append(l[0])
    timestamp_.append(l[1])
    
neuron_=np.array(neuron_).astype('int32')
timestamp_ = np.array(timestamp_).astype('float')

print neuron_


MPI_COMM_SIZE = 1024
sd_id = 872

rel_id_neuron =  (neuron_-sd_id)/MPI_COMM_SIZE

plt.plot(timestamp_, rel_id_neuron, 'o')
plt.show()




