import numpy as np
import matplotlib.pyplot as plt

#R4 = np.genfromtxt('long_4k.285126.csv', dtype=['i4', 'i4', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8'], delimiter=',', names=True)
R6_2 = np.genfromtxt('long_6k.2.159372.csv', dtype=['i4', 'i4', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8'], delimiter=',', names=True)
#R8 = np.genfromtxt('long_8k.284455.csv', dtype=['i4', 'i4', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8', 'f8'], delimiter=',', names=True)



R = R6_2
num_procs = np.max(R['rank'])+1
num_iter = len(R[R['rank']==0])
M = np.zeros([num_procs, num_iter])
C = np.zeros([num_procs, num_iter])
for r in range(0,num_procs):
  M[r] = R['heap'][R['rank']==r][0:num_iter]
  C[r] = np.cumsum(R['new_cons'][R['rank']==r][0:num_iter])
  #plt.plot(R['new_cons'][R['rank']==r])
  
#np.savetxt('M4.dat', np.transpose([np.mean(M, axis=0), np.min(M, axis=0), np.max(M, axis=0)]),fmt='%f %f %f', header='mean min max') 
#np.savetxt('C4.dat', np.transpose([np.mean(C, axis=0), np.min(C, axis=0), np.max(C, axis=0)]),fmt='%f %f %f', header='mean min max')

plt.plot(np.mean(M, axis=0), 'r--')
plt.plot(np.min(M, axis=0), 'r')
plt.plot(np.max(M, axis=0), 'r')

#R = R6
#num_procs = np.max(R['rank'])+1
#num_iter = len(R[R['rank']==0])
#M = np.zeros([num_procs, num_iter])
#C = np.zeros([num_procs, num_iter])
#for r in range(0,num_procs):
#  M[r] = R['heap'][R['rank']==r][0:num_iter]
#  C[r] = np.cumsum(R['new_cons'][R['rank']==r][0:num_iter])
  #plt.plot(R['new_cons'][R['rank']==r])

#np.savetxt('M6.dat', np.transpose([np.mean(M, axis=0), np.min(M, axis=0), np.max(M, axis=0)]),fmt='%f %f %f', header='mean min max') 
#np.savetxt('C6.dat', np.transpose([np.mean(C, axis=0), np.min(C, axis=0), np.max(C, axis=0)]),fmt='%f %f %f', header='mean min max')

#plt.plot(np.mean(C, axis=0), 'g--')
#plt.plot(np.min(C, axis=0), 'g')
#plt.plot(np.max(C, axis=0), 'g')

#R = R8
#num_procs = np.max(R['rank'])+1
#num_iter = 80
#M = np.zeros([num_procs, num_iter])
#C = np.zeros([num_procs, num_iter])
#for r in range(0,num_procs):
#  M[r] = R['heap'][R['rank']==r][0:num_iter]
#  C[r] = np.cumsum(R['new_cons'][R['rank']==r][0:num_iter])
  #plt.plot(R['new_cons'][R['rank']==r])

#np.savetxt('M8.dat', np.transpose([np.mean(M, axis=0), np.min(M, axis=0), np.max(M, axis=0)]),fmt='%f %f %f', header='mean min max') 
#np.savetxt('C8.dat', np.transpose([np.mean(C, axis=0), np.min(C, axis=0), np.max(C, axis=0)]),fmt='%f %f %f', header='mean min max')

#plt.plot(np.mean(C, axis=0), 'b--')
#plt.plot(np.min(C, axis=0), 'b')
#plt.plot(np.max(C, axis=0), 'b')
	 
	 
plt.show()

