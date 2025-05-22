---
tags:
  - lesson
  - session
---

# Summary

I can submit jobs that use a GPU.

```bash
#SBATCH -p node
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH --gpus-per-node=2
```

I can transfer files to/from Bianca using `rsync`.

```bash
ssh sven@transit.uppmax.uu.se
mount_wharf sens2025560
rsync my_local_file.txt sven@transit.uppmax.uu.se:sens2025560
rsync --recursive my_folder sven@transit.uppmax.uu.se:sens2025560
```

I can see the CPU and memory usage of jobs

```bash
jobstats --plot 1234567
```

I understand how to set up jobs efficiently

- Enough cores for memory
- CPU limited? Consider adding more until CPU usage is around 80% on average
- Consider adding 1 core for safety

I understand how to install software myself

- Julia:
    - install locally with `using <package-name>`
    - copy `~/.julia/packages` to Bianca
- Python `pip`
    - install locally with `pip install`
    - copy `~/.local/lib/python<version>/site-packages/` to Bianca
- Python `conda`

    ```bash
    module load conda
    export CONDA_ENVS_PATH=/proj/sens2025560/$USER
    conda create -c conda-forge --prefix $CONDA_ENVS_PATH/bianca-course python=3.7 numpy=1.15
    source activate bianca-course
    pip list
    python -V
    conda deactivate
- R:    ```
    - install locally with `install.packages`
    - copy `~/R/x86_64-pc-linux-gnu-library/4.2` to Bianca

I understand what containers are.

- Apptainer
- Docker
- Singularity

I can can run the voted-for IDE on Bianca

- Jupyter:

  ```bash
  module load python/3.11.4
  jupyter-notebook --ip 0.0.0.0 --no-browser
  ```

- RStudio:

  ```bash
  nteractive -A sens2025560 -n 2 -t 8:00:00
  module load R/4.3.1 R_packages/4.3.1 RStudio/2023.06.2-561
  rstudio
  ```

- VSCodium:

  ```bash
  module load VSCodium/latest
  code
  ```
