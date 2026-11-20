from timeit import default_timer as timer
import numpy as np
import torch

NUM_ELEMENTS = 1_000_000

def vector_add_cpu(a, b):
    c = np.zeros(NUM_ELEMENTS, dtype=np.float32)
    for i in range(NUM_ELEMENTS):
        c[i] = a[i] + b[i]
    return c

def vector_add_gpu(a, b):
    a_d = torch.from_numpy(a).cuda()
    b_d = torch.from_numpy(b).cuda()
    c = (a_d + b_d).cpu().numpy()
    return c

assert torch.cuda.is_available(), "CUDA not available"

a = np.ones(NUM_ELEMENTS, dtype=np.float32)
b = np.ones(NUM_ELEMENTS, dtype=np.float32)

start = timer()
vector_add_cpu(a, b)
cpu_time = timer() - start

start = timer()
vector_add_gpu(a, b)
gpu_time = timer() - start

print("CPU function took (seconds):", cpu_time)
print("GPU function took (seconds):", gpu_time)
