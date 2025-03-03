#!/bin/bash
for i in {0..10}
do
  sbatch -A sens2023598 run_simulation.sh ${i}
done
