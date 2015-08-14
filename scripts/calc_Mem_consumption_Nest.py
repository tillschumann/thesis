import numpy as np
from pylab import *


def PI_NEST(M,T,N,K):
  beta=0.8
  Nm = N/M
  Km = Nm*K
  Kstdp_m = Km * beta**2
  Kstat_m = Km - Kstdp_m
  Nvp = Nm/T
  Nc1 = (1.-(1./(M*T*Nvp)))**(K/(M*T)-1.)*K/(M*T)
  Kvp = Nvp*K
  Ncb1 = (1.-(1.-1./N)**Kvp-(1.-1./N)**(Kvp-1)*(1/N)*Kvp)*N
  return 0.33 * T * N + T * Nc1 * 24. + T * Ncb1 * 128. + Kstat_m * 16. + Kstdp_m * 24.


T = 8.
#K = 1500.
K=2500.
N = 8.0e7

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
L0 = 80./1073741824.
Ls = 4./1073741824.
theta = 0.5


WS = [((16.-pi)-9.*L0-4.*Ls*m)/(Ls*(4.+1./theta)) for m, pi in zip(M,PI)]

C = [N*K/ws for ws in WS]

plot(M[21:],WS[21:])
title("predicted maximum chunk size w*s")
xlabel("number of MPI nodes")
ylabel("chunk size w*s")


show()

plot(M[21:],C[21:])
title("predicted best-case algorithms iterations with maximum chunk size")
xlabel("number of MPI nodes")
ylabel("number of iterations")

show()