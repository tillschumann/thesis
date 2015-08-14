import numpy as np
import csv
import matplotlib.pyplot as plt

import matplotlib as mpl
import matplotlib.cm as cm
from matplotlib.patches import Polygon

traceFile=csv.reader(open("traceFile8.csv","rb"),delimiter=';')


x=np.array(list(traceFile))

rank_ = np.array(x[:,0]).astype('int32')
thread_ = np.array(x[:,1]).astype('int32')
name_ = x[:,2]
ptr_ = np.array(x[:,3]).astype('int32')
begin_ = np.array(x[:,4]).astype('int64')

#print max(x[:,5])
#print type(x[1,5]), " ", x[1,5]
#end_ = np.zeros([len(x[:,5])], dtype="int64")

#for i in range(0,len(x[:,5])):
#  if len(x[i,5])<12:
#    end_[i] = int(x[i,5])
  #print end_[i], "=", x[i,5] 


#print max(end_)

end_ = np.array(x[:,5]).astype('int64')
#print max(end_)

si = np.argsort(begin_)

rank_ = rank_[si]
thread_ = thread_[si]
name_ = name_[si]
ptr_ = ptr_[si]
begin_ = begin_[si]
end_ = end_[si]

threads_per_rank = np.max(thread_)+1

#for i in range(0, (1+np.max(rank_))*threads_per_rank):
#  ind = ((rank_*threads_per_rank+thread_)==i)
#  names = np.unique(name_[ind])
#  print "ind=%i "%i, names
  
  
gnames = np.unique(name_)


duration = end_-begin_



r0 = rank_==0


lnames = np.unique(name_[r0])


for gname in gnames:
  plt.hold(True)
  V = np.zeros([1024, 106])
  for r in range(0,1024):
    rm = rank_==r
    tmp = duration[np.logical_and(rm, name_==gname)]
    
    #l_con_begin = begin_[np.logical_and(rm, name_=="connect")]
    #l_con_end = end_[np.logical_and(rm, name_=="connect")]
    #tmp = np.cumsum(l_con_begin[1:]-l_con_end[:-1])/60.
    #tmp = l_con_begin[1:]-l_con_end[:-1]
    
    V[r,:len(tmp)] = tmp/1000./1000.
  plt.figure()
  plt.title(gname)
  plt.imshow(V, interpolation='nearest', cmap=plt.cm.ocean, aspect='auto')
  plt.colorbar()
  
  print gname, ".. plotted"
 
plt.hold(True)
V = np.zeros([1024, 106])
for r in range(0,1024):
  rm = rank_==r
  tmp1 = duration[np.logical_and(rm, name_=="communicate")]
  tmp2 = duration[np.logical_and(rm, name_=="mpi wait")]
  
  #l_con_begin = begin_[np.logical_and(rm, name_=="connect")]
  #l_con_end = end_[np.logical_and(rm, name_=="connect")]
  #tmp = np.cumsum(l_con_begin[1:]-l_con_end[:-1])/60.
  #tmp = l_con_begin[1:]-l_con_end[:-1]
  
  V[r,:len(tmp1)] = (tmp1-tmp2)/1000./1000.
plt.figure()
plt.title("communicate-mpi wait")
plt.imshow(V, interpolation='nearest', cmap=plt.cm.ocean, aspect='auto')
plt.colorbar()

print gname, ".. plotted"

#for lname in lnames:
#  r0_ln_duration = duration[np.logical_and(r0, name_==lname)]
#  print lname, " duration: ", np.sum(r0_ln_duration)/1000/1000/60, " minutes"
   
#  l_con_begin = begin_[np.logical_and(r0, name_==lname)]
#  l_con_end = end_[np.logical_and(r0, name_==lname)]

  #l_con_diff = (l_con_begin[1:]-l_con_end[:-1])/1000/1000
  #plt.plot(l_con_diff, label=lname)
  
#  plt.plot(r0_ln_duration/1000/1000, label=lname)
  
#plt.legend(lnames)
  
  






plt.show()