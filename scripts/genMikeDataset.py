from __future__ import print_function
import nest
import h5py
import numpy as np



non=int(1e4)

f = h5py.File('gen/cell_body_positions.h5','w')
dset = f.create_dataset("x", (non,1), dtype='d', data=np.random.rand(non,1))
dset = f.create_dataset("y", (non,1), dtype='d', data=np.random.rand(non,1))
dset = f.create_dataset("z", (non,1), dtype='d', data=np.random.rand(non,1))
f.close()


outdegree = int(15e2)

neurons = nest.Create("iaf_neuron", non)
conn_dict = {'rule': 'fixed_outdegree', 'outdegree': outdegree}
nest.Connect(neurons,neurons,conn_dict)

nof = 100
sneuron = 1

for i in range(0,nof):
	non_f = non/nof
	if (non%nof > i):
		non_f += 1
	
	print ('create gen/connectome_'+str(i)+'.h5')

	f = h5py.File('gen/connectome_%i.h5'%i,'w')
	dset = f.create_dataset("000", (outdegree+1,non_f), dtype='i4')


	dset[0,:] = range(sneuron-1,non_f+sneuron-1)
	con = np.zeros([outdegree,non_f], dtype='int')

	for n in range (0,non_f):
	  print(str(n*100/non_f)+'%', end='\r')
	  x = nest.GetConnections([int(n+sneuron)])
	  for c in range(0,outdegree):
	    #print c+1, n-1, x[c][1] 
	    con[c][n-1] = x[c][1]-1

	#print con

	dset[1:,:] = con

	sneuron += non_f



	f.close()
