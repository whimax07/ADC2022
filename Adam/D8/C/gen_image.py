from matplotlib import pyplot as plt
import numpy as np

with open('input.txt', 'r') as f:
    m = np.array([[int(v) for v in l.replace('\n', '')] for l in f.readlines()])
    plt.imshow(m)
    plt.show()
