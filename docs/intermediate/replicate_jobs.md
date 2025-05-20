---
tags:
  - lesson
  - session
---

# Replicate jobs

!!!- info "Learning outcomes"

    - Practice using the UPPMAX documentation
    - I can schedule a job that has replicates

???- question "Want to see this session as a video?"

    Watch the YouTube video
    ['Intermediate Bianca workshop: replicate jobs'](https://youtu.be/frGUu8Hhr-g).

???- question "For teachers"

    Teaching goals are:

    - Learners have practiced using the UPPMAX documentation
    - Learners have scheduled a job that has replicates

    Lesson plan:

    ```mermaid
    gantt
      title Replicate jobs
      dateFormat X
      axisFormat %s
      section First hour
      Course introduction: done, course_intro, 0, 10s
      Prior : intro, after course_intro, 5s
      Present: theory_1, after intro, 5s
      Challenge: crit, exercise_1, after theory_1, 40s
      Break: crit, milestone, after exercise_1
      section Second hour
      Challenge: crit, exercise_2, 0, 10s
      Feedback: feedback_2, after exercise_2, 10s
      SLURM: done, slurm, after feedback_2, 25s
      Break: done, milestone, after slurm
    ```

    Prior questions:

    - You have a simulation that uses randomness. You want to run
      it 1000 times. How would you do that?


## Why?

You have a simulation that uses randomness.
You want to run 1000 replicates of it. How would you do that?

## The simulation

This is the bash script of a simulation,
called [`run_simulation.sh`](scripts/run_simulation.sh):

```bash
#!/bin/bash
echo $((1 + ($RANDOM % 6))) > result_$1.txt
```

It simulates a dice throw.

This is a toy simulation instead of a real simulation:
there is no need to burden an HPC cluster with a real simulation
to learn how to use job arrays.

## Methods to run replicate jobs

There are multiple methods to run replicate jobs,
these are the methods shown in this session:

Method             |Features
-------------------|--------------------------------------------------------
Slurm job arrays   |Slurm does the replication for you, Slurm friendly
Use a bash for loop|Need to write the replication and interaction with Slurm

## Replicate jobs using bash

This is the bash script to run replicate jobs using bash,
called [`submit_runs_using_bash.sh`](scripts/submit_runs_using_bash.sh):

```bash
#!/bin/bash
for i in {0..10}
do
  sbatch -A sens2025560 run_simulation.sh ${i}
done
```

Run it by:

```bash
./submit_runs_using_bash.sh
```

## Replicate jobs using a job array

This is the bash script to run replicate jobs using a Slurm job array,
called [`submit_runs_using_job_array.sh`](scripts/submit_runs_using_job_array.sh):

```bash
#!/bin/bash
#SBATCH --array=0-10
./run_simulation.sh ${SLURM_ARRAY_TASK_ID}
```

Run it by:

```bash
sbatch -A sens2025560 submit_runs_using_job_array.sh
```

## Exercises

### Exercise 1: run replicate jobs using Slurm job arrays

- Create the script [`run_simulation.sh`](scripts/run_simulation.sh)
- Create the script [`submit_runs_using_job_array.sh`](scripts/submit_runs_using_job_array.sh)
- Submit the script `submit_runs_using_job_array.sh`
- How does the queue look like?
- How many result files are created: ten or eleven?

### (optional) Exercise 2: run replicate jobs using bash

- Create the script [`run_simulation.sh`](scripts/run_simulation.sh)
- Create the script [`submit_runs_using_bash.sh`](scripts/submit_runs_using_bash.sh)
- Run the script `submit_runs_using_bash.sh`
- How does the queue look like?
- How many result files are created: ten or eleven?
