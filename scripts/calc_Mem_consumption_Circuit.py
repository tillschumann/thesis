import numpy as np
from pylab import *

def PI_N(M,N):
  Nm = N/M

  return Nm*(24+1100)

def PI_C(M,T,N,K):
  mk = 52.
  mc1 = 24.
  mcd = 48.

  Nc1 = 

  return 0.33 * T * N + T * Nc1 * mc1 + Km * mk

def PI_NEST(M,T,N,K):
  return PI_N(M,N) + PI_C(M,T,N,K)


T = 8.
#K = 1500.
#K=2500.
K=11000
N = 18e6

M = range(1,4096)

PI = [PI_NEST(m,T,N,K)/1073741824. for m in M]

title("predicted memory consumption vs available memory on BG/Q for the mouse brain model")
xlabel("number of MPI nodes")
ylabel("predicted memory consumption in GByte per Node")

maxmem = plot([0,len(M)],[16,16])
hold(True)
predmem = plot(M,PI)

legend(["Memory available", "Predicted memory"])


show()


###
#L0 = 80./1073741824.
#Ls = 4./1073741824.
#theta = 0.5


#WS = [((16.-pi)-9.*L0-4.*Ls*m)/(Ls*(4.+1./theta)) for m, pi in zip(M,PI)]

#C = [N*K/ws for ws in WS]

#plot(M[21:],WS[21:])
#title("predicted maximum chunk size w*s")
#xlabel("number of MPI nodes")
#ylabel("chunk size w*s")


#show()

#plot(M[21:],C[21:])
#title("predicted best-case algorithms iterations with maximum chunk size")
#xlabel("number of MPI nodes")
#ylabel("number of iterations")

#show()
