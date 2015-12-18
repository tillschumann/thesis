import h5py
import numpy as np

##
## cut all spike trains at given t
##
def cut(neurons, spikes, t, t0=0):
  c=1
  for spiketrain in spikes:
    if np.any(spiketrain<=t) and np.any(spiketrain>t0):
      c+=1
  
  print "new length:",c
  
  cut_neurons = np.zeros(c).astype('int32')
  cut_spikes = data=np.array(np.zeros(c),dtype=object)
  
  c=0
  i=0
  for spiketrain in spikes:
    if np.any(spiketrain<=t) and np.any(spiketrain>t0):
      cut_neurons[c] = neurons[i]
      cut_spikes[c] = spiketrain[np.logical_and(spiketrain<t, spiketrain>t0)]
      c+=1
    i+=1
    
  return [cut_neurons, cut_spikes]

def compare(neurons1, spikes1, neurons2, spikes2):
  import matplotlib.pyplot as plt
  [sn1,ss1]=sort(neurons1,spikes1)
  [sn2,ss2]=sort(neurons2,spikes2)
  
  #sn1 = neurons1
  #ss1 = spikes1
  #sn2 = neurons2
  #ss2 = spikes2
  
  in1 = np.in1d(sn1, sn2)
  in2 = np.in1d(sn2, sn1)
  
  nin = len(sn1[in1])
  
  print "Neuron in 1 but not in 2:", len(sn1)-nin
  print "Neuron in 2 but not in 1:", len(sn2)-nin
  
  for i in range(0,nin):
    if np.any(ss1[in1][i] > 0) and np.any(ss2[in2][i] > 0):
      if (len(ss1[in1][i]) == len(ss2[in2][i])):
	plt.plot(ss1[in1][i]-ss2[in2][i], i*np.ones([len(ss1[in1][i]),1]), '*')
      else:
	print "For neuron", sn1[in1][i], "difference in length of spiketrains: ", len(ss1[in1][i]) - len(ss2[in2][i])
	print "ss1:", ss1[in1][i]
	print "ss2:", ss2[in2][i]
	#plt.plot(ss1[in1][i][:np.min(len(ss1[in1][i]), len(ss2[in2][i]))]-ss2[in2][i][:np.min(len(ss1[in1][i]), len(ss2[in2][i]))], i*np.ones([np.min(len(ss1[in1][i]), len(ss2[in2][i])),1]), '*')
  plt.show()

def sort(neurons, spikes):
  argn = np.argsort(neurons)
  return [neurons[argn],spikes[argn]]

def sort(neurons, spikes):
  argn = np.argsort(neurons)
  return [neurons[argn],spikes[argn]]

def t0sort(neurons, spikes):
  t0 = np.zeros(len(neurons))
  
  for i in range(0,len(neurons)):
    t0[i] = spikes[i][0]
  argn = np.argsort(t0)
  return [neurons[argn],spikes[argn]]

def dotplot(spikes):
  import matplotlib.pyplot as plt
  
  for i in range(0,len(spikes)):
    if np.any(spikes[i] > 0):
      plt.plot(spikes[i], i*np.ones([len(spikes[i]),1]), '|')
  plt.show()

s1 = np.load('tmp/spikes.npy')
n1 = np.load('tmp/neurons.npy')-2

#s3 = np.load('csaba3/spikes.npy')
#n3 = np.load('csaba3/neurons.npy')

#[n1, s1] = cut(n1,s1,10,0)
#[n2, s2] = cut(n3,s3,20)

#[sn,ss]=sort(cn,cs)

[n1,s1]=t0sort(n1,s1)


print n1[3280:]

dotplot(s1)

#compare(n1,s1,n2,s2)

