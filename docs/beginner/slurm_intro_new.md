---
tags:
  - lesson
  - session
  - beginner
  - slurm
  - batch
  - interactive
  - compute
  - node
  - core
---

# Introduction to Slurm

!!! info "Learning outcomes"

    - This is a short introduction in how to reach the calculation/compute/worker nodes
    - Know when to run interactive and when to use batch system
    - Run interactively on compute nodes
    - Run simple jobs
    - Plan your jobs
    - Check the progress of your jobs
    - Use the UPPMAX documentation

???- info "Notes for teachers"

    Teaching goals:

    - The learners demonstrate to have run in interactive
    - The learners demonstrate to have run batch job
    - The learners demonstrate to have understood when to use batch or interactive
    - The learners demonstrate to have understood how to plan for jobs

    Schedule (50 minutes):

    - 10 minutes: lecturing
    - 5 minutes type-alongs ??
    - 20 minutes: exercise + quiz
    - 5 minutes: discuss answers

## What & Why

- You are already on the login node. Heavy work must run on compute nodes.
- Slurm books (reserves) cores + time for you so jobs from many researchers can share the cluster fairly.

### Mental Model: Hardware

- Login node: lightweight command & submission point (do not run heavy jobs here)
- Compute nodes: where your jobs actually run
- Node: a physical machine; Core: one processing unit within a node

???- info  "Hardware Diagram"

    #### Overview

    ![nodes principle](./img/nodes.png)

    #### Inside a node

    ![node principle](./img/node.png)


Glossary (quick): Node, Core, Partition, Job, Wall time, Core-hours.

### Core concepts

- Interactive session = temporary shell on a compute node (fast feedback)
- Batch job = script submitted; runs unattended; releases resources when done
- Resource request = (project, partition, cores, wall time)
- Core-hours = cores x (actual runtime)

## Decide: Interactive or Batch

???- tip "Decision maker"

    ```mermaid
    flowchart TD
        UPPMAX(What to run on which node?)
        operation_type{What type of operation/calculation?}
        interaction_type{Need live tweaking or GUI?}
        login_node(Work on login node)
        interactive_node(Interactive session)
        calculation_node(Batch Job)

        UPPMAX-->operation_type
        operation_type-->|light,short|login_node
        operation_type-->|heavy,long|interaction_type
        interaction_type-->|Yes|interactive_node
        interaction_type-->|No|calculation_node
    ```

Rule of thumb:

- Development / GUI / rapid loop / plotting => Interactive
- Long, unattended, repeats, many samples => Batch
- Many short independent tasks => Batch (later: arrays)

## Minimal Commands

| Action | Command (example) |
|-------|-------------------|
| Interactive session | `interactive -A sens2025560 -p core -n 1 -t 00:10:00` |
| Submit batch | `sbatch job.sh` |
| List my in-queue jobs | `squeue --me` or `jobinfo` |
| Cancel a job | `scancel <jobid>` |
| Override cores/time | `sbatch -n 2 -t 00:05:00 job.sh` |

Keep modules: load them INSIDE the interactive session or inside the batch script.

## Hands-on A: Interactive

1. Start:
   
    ```
    interactive -A sens2025560 -p core -n 2 -t 02:00:00
    ```

    (If waiting PENDING: observe later with `squeue --me` or `jobinfo`.)

2. Inside node:
    
    ```
    hostname
    module load bioinfo-tools
    exit
    ```

3. Confirm you are back on login node (`hostname` changes).


## Hands-on B: First Batch Job

Create file `hello_job.sh`:

```bash
#!/bin/bash -l
#SBATCH -A sens2025560
#SBATCH -p devcore
#SBATCH -n 1
#SBATCH -t 00:02:00
#SBATCH -J hello
#SBATCH -o hello_%j.out

echo "Node: $(hostname)"
date
sleep 15
echo "Done."
```

Submit:

```
sbatch hello_job.sh
squeue --me
```

After it finishes:

```
cat hello_<jobid>.out
```

Try a re-submit with 2 cores overriding script:

```
sbatch -n 2 hello_job.sh
```

(Add an `srun hostname` line to see per-task output.)

## Monitoring & Cancellation

- `squeue --me` : Your waiting jobs. Look at ST (R=running, PD=pending)
- `jobinfo` : All your running and waiting jobs.
- `bianca_combined_jobinfo` : All the running and waiting jobs on Bianca
- Reasons (e.g. ReqNodeNotAvail, JobArrayTaskLimit, Resources)
- Cancel (demo): `scancel <jobid>`
- Output files pattern: defined with `-o` or default `slurm-<jobid>.out`

## Efficiency & Core-hours

Formula: core-hours = cores x (requested time if job runs full time; charged up to what you reserve).  
Examples:

- 1 core x 2 h = 2 core-h
- 8 cores x 0.5 h = 4 core-h

Interactive idle problem: reserving 4 cores for 8 h but active use 1 h ⇒ charged 32 vs useful 4 core-h.

Mini Exercise:
Choose minimal sufficient request for a script expected to run 12 min on 1 core:

- Bad: `-n 4 -t 02:00:00` (too much resources requested)
- Good: `-n 1 -t 00:20:00` (book twice the hours)

## Scenario Quiz

Decide Interactive or Batch + minimal flags:
1. 6 h genome alignment (no interaction)
2. Rapid R plotting tuning (needs live edits)
3. 200 independent 1 min QC runs
4. GUI RStudio exploratory stats (≤4 h)
5. Pipeline already validated (repeat weekly)

(Poll)

## Cheat Sheet

Flags today:

- `-A` project
- `-p` partition (`devcore`/`devel` for small tests, `core` general, `node` whole node)
- `-n` cores
- `-N` nodes
- `-t` wall time (HH:MM:SS or D-HH:MM:SS)
Optional (read later):
- `-J` job name
- `-o` output filename
- `--mail-type=BEGIN,END,FAIL`
- `-C mem256GB` (fat node), `-C gpu`, `--gpus-per-node 1`

## Sensitive Data Reminders

- Use provided workshop/sample data for practice.
- Keep data/outputs in `/proj/sens2025560/...` not only `$HOME` or wharf.
- No external data pulls mid-job. Bianca is cut-off from internet.

## Optional (Self-Study After Class)

- RStudio in an interactive session
- Advanced bioinformatics workflow (GATK + snpEff)
- Efficient multi-core & job arrays (see intermediate: efficient jobs)
- Monitoring resource usage: `jobstats`

...existing code...

## EXTRA: Advanced Workflow (Optional, not in 45 min)

... move existing GATK/snpEff example here unchanged ...

...existing code...

## Links

(Keep existing links list)
...existing code...