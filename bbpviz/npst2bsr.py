# Convert Numpy spike trains to binary spike reports


import numpy as np
import struct


print "Convert Numpy spike trains to binary spike reports"

spikes = np.load("spikes.npy")
sender = []
time    = []


with open('data.bsr', 'wb') as f:
	f.write(struct.pack('i', 3850)) #magic
	f.write(struct.pack('i', 1)) #version
	for itt,tt in enumerate(spikes):
	    for ttt in tt:
		sender.append(itt)
        	time.append(ttt)

	x = np.argsort(time)
	time = np.take(time,x)
	sender = np.take(sender,x)
	
	for i in range(0,len(time)):
		#print time[i], " - ", sender[i]
		f.write(struct.pack('fi', time[i], sender[i])) # time & sender
