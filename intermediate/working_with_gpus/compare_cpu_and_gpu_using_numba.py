from timeit import default_timer as timer

import numpy as np
from numba import vectorize

# Accuracy of the test: the bigger this value,
# the more accurate the measurement is
NUM_ELEMENTS = 100000000

# DONT: this is an unfair comparison: most time is spent in the for loop
def vector_add_cpu(a, b):
  c = np.zeros(NUM_ELEMENTS, dtype=np.float32)
  for i in range(NUM_ELEMENTS):
      c[i] = a[i] + b[i]
  return c

@vectorize(["float32(float32, float32)"], target='cuda')
def vector_add_gpu(a, b):
  return a + b;

# The numbers to work on
many_numbers_1 = np.ones(NUM_ELEMENTS, dtype=np.float32)
many_numbers_2 = np.ones(NUM_ELEMENTS, dtype=np.float32)

# Time the CPU function
start = timer()
vector_add_cpu(many_numbers_1, many_numbers_2)
vector_add_cpu_time = timer() - start

# Time the GPU function
start = timer()
vector_add_gpu(many_numbers_1, many_numbers_2)
vector_add_gpu_time = timer() - start

# Report times
print("CPU function took (seconds):", vector_add_cpu_time)
print("GPU function took (seconds):", vector_add_gpu_time)
