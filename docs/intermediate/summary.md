---
tags:
  - lesson
  - session
---

# Summary

I can transfer files to/from Bianca using `rsync`

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

I can schedule a simple workflow of jobs that depend on each other using Slurm

```bash
sbatch --A sens2025560 --dependency=afterok:5000000,5000001 do_c.sh
```

I can schedule a simple workflow of jobs that depend on each other using Nextflow

```text
[not discussed much]
```

I can run replicate jobs using Slurm job arrays

```bash
#SBATCH --array=0-10
```

I understand how to install software myself

```bash
[many steps]
```

I understand how to use packages and libraries for scripts

```bash
[many steps]
```

I understand what containers are

```bash
[many steps]
```

I understand how to build from source

```bash
[many steps]
```

I can can run the voted-for IDE on Bianca

```bash
nteractive -A sens2025560 -n 2 -t 8:00:00
module load R/4.3.1 R_packages/4.3.1 RStudio/2023.06.2-561
rstudio
```
