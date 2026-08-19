#!/bin/bash
for i in {0..10}
do
  sbatch -A sens2025560 run_simulation.sh ${i}
done
