#!/bin/bash
#SBATCH --array=0-10
./run_simulation.sh ${SLURM_ARRAY_TASK_ID}
