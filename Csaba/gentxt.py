import numpy as np

spikes = np.load("spikes.npy")
sender = []
time    = []
for itt,tt in enumerate(spikes):
    for ttt in tt:
        sender.append(itt)
        time.append(ttt)
np.savetxt("spikesenders.txt", np.array(sender, np.int64), fmt="%i" )
np.savetxt("spiketimes.txt", time)
