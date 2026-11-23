from timeit import default_timer as timer
import numpy as np
import torch

NUM_ELEMENTS = 100_000_000

def vector_add_cpu(a, b):
    return a + b

def vector_add_gpu(a, b):
    return a + b                    # a, b are already on the GPU

assert torch.cuda.is_available(), "CUDA not available"

a = np.ones(NUM_ELEMENTS, dtype=np.float32)
b = np.ones(NUM_ELEMENTS, dtype=np.float32)

# Copy data to the GPU (timed separately)
start = timer()
a_gpu = torch.from_numpy(a).cuda()
b_gpu = torch.from_numpy(b).cuda()
torch.cuda.synchronize()
copy_time = timer() - start

# Warm-up (both sides)
vector_add_cpu(a, b)
vector_add_gpu(a_gpu, b_gpu)
torch.cuda.synchronize()

# Time the CPU function
start = timer()
vector_add_cpu(a, b)
cpu_time = timer() - start

# Time the GPU function
start = timer()
vector_add_gpu(a_gpu, b_gpu)
torch.cuda.synchronize()            # wait for the GPU to finish
gpu_time = timer() - start

print("Copy to GPU took (seconds): ", copy_time)
print("CPU function took (seconds):", cpu_time)
print("GPU function took (seconds):", gpu_time)
