from timeit import default_timer as timer
import numpy as np
import torch

NUM_ELEMENTS = 100_000_000

def vector_add_cpu(a, b):
    return a + b                    # vectorized numpy instead of a Python loop

def vector_add_gpu(a, b):
    a_d = torch.from_numpy(a).cuda()
    b_d = torch.from_numpy(b).cuda()
    c = (a_d + b_d).cpu().numpy()   # includes transfers, like numba's vectorize
    return c

assert torch.cuda.is_available(), "CUDA not available"

a = np.ones(NUM_ELEMENTS, dtype=np.float32)
b = np.ones(NUM_ELEMENTS, dtype=np.float32)

# Warm-up (CUDA context init would otherwise skew the timing)
vector_add_gpu(a[:10], b[:10])
torch.cuda.synchronize()

start = timer()
vector_add_cpu(a, b)
cpu_time = timer() - start

start = timer()
vector_add_gpu(a, b)
torch.cuda.synchronize()
gpu_time = timer() - start

print("CPU function took (seconds):", cpu_time)
print("GPU function took (seconds):", gpu_time)
