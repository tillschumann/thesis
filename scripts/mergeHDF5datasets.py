import numpy as np
import h5py


def mergedatasets(list_h5fn_connectome, hdf5_new):

  new_shape = [0,0]
  dtype = []
  
  for h5fn_connectome in list_h5fn_connectome:
    h5f_connectome = h5py.File(h5fn_connectome, "r")
    for h5k_item in h5f_connectome.keys():
      new_shape[0] = max(new_shape[0], h5f_connectome[h5k_item].shape[0])
      new_shape[1] += h5f_connectome[h5k_item].shape[1]
      dtype = h5f_connectome[h5k_item].dtype
      
  content = np.zeros(new_shape, dtype=np.uint)
  print 'content.shape', content.shape
  print 'size: %i MB'%int(content.shape[0]*content.shape[1]*4./1024./1024.)
  
  print 'dtype', dtype
  i=0
  
  print 'copy data'
  for h5fn_connectome in list_h5fn_connectome:
    h5f_connectome = h5py.File(h5fn_connectome, "r")
    for h5k_item in h5f_connectome.keys():
      for j in range(0,h5f_connectome[h5k_item].shape[0]):
	content[j][i:i+h5f_connectome[h5k_item].shape[1]] = h5f_connectome[h5k_item][j]
      i+=h5f_connectome[h5k_item].shape[1]
  print 'write data to file'
  with h5py.File(hdf5_new, 'w') as f:
    dset = f.create_dataset("000", (new_shape[0], new_shape[1]), dtype=dtype)
    dset[...] = content
      
mergedatasets(["connectome_000_034.h5", "connectome_005_035.h5", "connectome_072_008.h5", "connectome_131_068.h5"], 'merged.h5')
