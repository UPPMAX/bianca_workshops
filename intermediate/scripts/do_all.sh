#!/bin/bash
job_id_a=$(sbatch -A sens2025560 do_a.sh | cut -d " " -f 4)
job_id_b=$(sbatch -A sens2025560 do_b.sh | cut -d " " -f 4)
sbatch -A sens2025560 --dependency=afterok:${job_id_a},${job_id_b} do_c.sh
