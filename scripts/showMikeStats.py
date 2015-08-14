import numpy as np
import csv
import matplotlib.pyplot as plt



import matplotlib as mpl
import matplotlib.cm as cm
import matplotlib.mlab as mlab
from matplotlib.patches import Polygon


from scipy.stats import norm

#traceFile=csv.reader(open("mike_network_stats.txt","rb"),delimiter='\t')


#x=np.array(list(traceFile))

#neuron_ = np.array(x[:,0]).astype('int64')
#timestamp_ = np.array(x[:,1]).astype('float')

    
#neuron_ = np.zeros(71000000).astype('int32')
#ex_input_ = np.zeros(71000000).astype('int32')
#in_input_ = np.zeros(71000000).astype('int32')
#thalamus_ex_input_ = np.zeros(71000000).astype('int32')
#thalamus_in_input_ = np.zeros(71000000).astype('int32')

#s = 71000000
#i = 0


#for l in traceFile:
  #if (i%100000==0):
    #print i*100/s, "%"
  #n = int(l[0][7:-1])
  #if n <= 71000000:
    #neuron_[i] = n
    #ex_input_[i]=int(l[1][9:])
    #in_input_[i]=int(l[2][9:])
    #thalamus_ex_input_[i]=int(l[3][18:])
    #thalamus_in_input_[i]=int(l[4][18:])
    #i+=1
    
##neuron_=np.array(neuron_).astype('int32')
##ex_input_ = np.array(ex_input_).astype('int32')
##in_input_ = np.array(in_input_).astype('int32')
##thalamus_ex_input_ = np.array(thalamus_ex_input_).astype('int32')
##thalamus_in_input_ = np.array(thalamus_in_input_).astype('int32')


#np.save('stats_neuron', neuron_)
#np.save('stats_ex_input_', ex_input_)
#np.save('stats_in_input_', in_input_)
#np.save('stats_thalamus_ex_input_', thalamus_ex_input_)
#np.save('stats_thalamus_in_input_', thalamus_in_input_)

#neuron_=np.load('stats_neuron')
ex_input_=np.load('stats_ex_input_.npy')
in_input_=np.load('stats_in_input_.npy')
thalamus_ex_input_=np.load('stats_thalamus_ex_input_.npy')
thalamus_in_input_=np.load('stats_thalamus_in_input_.npy')




#data = [ex_input_, in_input_, thalamus_ex_input_, thalamus_in_input_]

# the histogram of the data
plt.subplot(4,1,1)

mu, std = norm.fit(ex_input_)
n, bins, patches = plt.hist(ex_input_, 200, normed=1, facecolor='green', alpha=0.75)
xmin, xmax = plt.xlim()
x = np.linspace(xmin, xmax, 100)
p = norm.pdf(x, mu, std)
plt.plot(x, p, 'k', linewidth=2)
title = "excitatory in degree: fit results: mu = %.2f,  std = %.2f" % (mu, std)
plt.title(title)


plt.subplot(4,1,2)
mu, std = norm.fit(in_input_)
n, bins, patches = plt.hist(in_input_, 200, normed=1, facecolor='red', alpha=0.75)
xmin, xmax = plt.xlim()
x = np.linspace(xmin, xmax, 100)
p = norm.pdf(x, mu, std)
plt.plot(x, p, 'k', linewidth=2)
title = "inhibitory in degree: fit results: mu = %.2f,  std = %.2f" % (mu, std)
plt.title(title)

plt.subplot(4,1,3)
n, bins, patches = plt.hist(thalamus_ex_input_, 200, normed=1, facecolor='blue', alpha=0.75)
mu, std = norm.fit(thalamus_ex_input_)
xmin, xmax = plt.xlim()
x = np.linspace(xmin, xmax, 100)
p = norm.pdf(x, mu, std)
plt.plot(x, p, 'k', linewidth=2)
plt.title("excitatory in degree to stimulated neurons: fit results: mu = %.2f,  std = %.2f" % (mu, std))


plt.subplot(4,1,4)
n, bins, patches = plt.hist(thalamus_in_input_, 200, normed=1, facecolor='yellow', alpha=0.75)
mu, std = norm.fit(thalamus_in_input_)
xmin, xmax = plt.xlim()
x = np.linspace(xmin, xmax, 100)
p = norm.pdf(x, mu, std)
plt.plot(x, p, 'k', linewidth=2)
plt.title("inhibitory in degree to stimulated neurons: fit results: mu = %.2f,  std = %.2f" % (mu, std))

#plt.plot(bins)

plt.show()



