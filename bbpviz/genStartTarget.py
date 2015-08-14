import numpy as np


x = np.arange(1, 2289097).astype(int)

np.savetxt('start.target', x,fmt='a%i', newline=' ', header='Target Cell Mosaic\n{\n ', footer='\n}',comments='')