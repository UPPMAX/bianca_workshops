---
tags:
  - lesson
  - session
---

# GPUs

!!!- info "Learning outcomes"

    - Practice using the UPPMAX documentation
    - I can see the GPU and memory usage of jobs
    - I know the correct flags to utilize GPUs.
    - I understand the GPU configuration on Bianca.


## Hardware and flags

- 10 Nodes with Nvidia A100 40 GB and 80 GB.
- Nodelist : sens2025xxx-b\[201-2010\]
- All GPU nodes have at least 256 GB RAM (fat nodes) with 16 CPU cores and 2 GPUs per node.
- In order to avoid GPU misuse, a project cannot request more than 7 GPU nodes, in total.
- SBATCH flags:

```bash
#SBATCH -A sens2025xxx
#SBATCH -p node
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH --gpus-per-node=2   #number of GPUs per node
#SBATCH -t 1:00:00

nvidia-smi
```

You can also ask for 1 gpu per node and few cores in order to use 2 gpus for different jobs:

```bash
#SBATCH -A sens2025xxx
#SBATCH -p core
#SBATCH -n 8
#SBATCH -C gpu
#SBATCH --gpus-per-node=1
#SBATCH -t 1:00:00
```

## GPU accessibility check

- Sanity check if CUDA is loaded properly by checking CUDA environment variable:

```bash
env | grep CUDA
CUDA_VISIBLE_DEVICES=0
```

OR

```bash
echo CUDA_VISIBLE_DEVICES
0
```

OR check by loading torch:

```bash
module load python_ML_packages/3.9.5-gpu
python -c "import torch; print(torch.__version__); print(torch.version.cuda); print(torch.cuda.get_device_properties(0)); print(torch.randn(1).cuda())"
```

output:

```bash
1.9.0+cu111
11.1
_CudaDeviceProperties(name='NVIDIA A100-PCIE-40GB', major=8, minor=0, total_memory=40326MB, multi_processor_count=108)
tensor([0.1014], device='cuda:0')
```


## Profiling

- Monitor GPU utilization with nvidia-smi:

    ```bash
    nvidia-smi dmon -o DT
    nvidia-smi --format=noheader,csv --query-compute-apps=timestamp,gpu_name,pid,name,used_memory --loop=1 -f sample_run.log
    ```

