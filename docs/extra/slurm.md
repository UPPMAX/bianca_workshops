---
tags:
  - lesson
  - session
---

# More about Slurm

- [Link to Slurm session in Intro to UPPMAX course](https://www.uu.se/download/18.57591c9d18f3ec99a0521784/1715116006615/c_560271-l_1-k_uppmax-slurm-2024-01.pdf){:target="_blank"}
- [Slurm documentation](https://slurm.schedmd.com/){:target="_blank"}
- [Slurm user guide](https://docs.uppmax.uu.se/cluster_guides/slurm/){:target="_blank"}
- [Discovering job resource usage with `jobstats`](https://docs.uppmax.uu.se/software/jobstats/){:target="_blank"}
- [Plotting your core hour usage](https://docs.uppmax.uu.se/software/projplot/){:target="_blank"}

## Example

Generate read-1 and read-2 fastq files from 1000 Genomes BAM working file restricted to GRCh38 chr1 and align back to GRCh38. Load modules.

    module load bioinfo-tools samtools/1.17 bwa/0.7.17

Begin by creating local symlink to the working BAM and its index.

    ln -s /sw/data/KGP/1000G_2504_high_coverage/working/2020_01_13_erikg/test_BAM_chr1_11464076_11466075.bam* .

Sort reads by name, keep result in `test_BAM_chr1_11464076_11466075.name.bam`.

    samtools collate -@ 2 -o test_BAM_chr1_11464076_11466075.name.bam test_BAM_chr1_11464076_11466075.bam

Extract paired reads into `test_BAM_chr1_11464076_11466075.r1.fastq.gz` and
`test_BAM_chr1_11464076_11466075.r2.fastq.gz`, discard singletons and others.

    samtools fastq -n -0 /dev/null -s /dev/null -1 test_BAM_chr1_11464076_11466075.r1.fastq.gz -2 test_BAM_chr1_11464076_11466075.r2.fastq.gz test_BAM_chr1_11464076_11466075.name.bam

Create local symlinks to the iGenomes BWA index for GRCh38.

    ln -s /sw/data/iGenomes/Homo_sapiens/NCBI/GRCh38/Sequence/BWAIndex/genome.fa* .


### Good job: efficient use of requested cores


The SLURM script `run_good.sh` runs an efficient job, which requests 8 cores and uses 8 for mapping and 2 to generate the BAM file:

```bash
#!/bin/bash -l

#SBATCH -A sens2025560
#SBATCH -t 8:00:00
#SBATCH -n 8
#SBATCH -o run_good.out

module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.17

bwa mem -t 8 genome.fa NA12878_WGS_possorted_bam.chr1.r1.fastq.gz NA12878_WGS_possorted_bam.chr1.r2.fastq.gz | samtools view -Sb -@ 2 - > good.bam
```

### Poor job: inefficient use of requested cores

The SLURM script `run_poor.sh` runs an inefficient job, which also requests 8 cores but only uses 2 for mapping and 1 to generate the BAM file:

```bash
#!/bin/bash -l

#SBATCH -A sens2025560
#SBATCH -t 12:00:00
#SBATCH -n 8
#SBATCH -o run_poor.out

module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.17

bwa mem -t 2 genome.fa NA12878_WGS_possorted_bam.chr1.r1.fastq.gz NA12878_WGS_possorted_bam.chr1.r2.fastq.gz | samtools view -Sb - > poor.bam
```

### Examining jobstats plots

Examine the jobs run by user `douglas`. The relevant job numbers are the jobs with the highest jobid= numbers that have the names names `run_good.sh` and `run_poor.sh`. These should appear at the end of the output.

    finishedjobinfo -u douglas

We find these are job numbers 18 for `run_good.sh` and 19 for `run_poor.sh`. Generate jobstats plots for each job.

    jobstats -p 18 19

This generates two PNG image files, one for each job. These are named `cluster-project-user-jobid.png`. Examine them both using an image viewer.

    eog bianca-sens2025560-douglas-18.png bianca-sens2025560-douglas-19.png


??? "Extra: How compute nodes are moved between project clusters"

    The total job queue, made by putting together job queues of all project clusters, is monitored, and acted upon, by an external program, named meta-scheduler.

    In short, this program goes over the following procedure, over and over again:

    1. Finds out where all the compute nodes are: on a specific project cluster or yet unallocated.
    1. Reads status reports from all compute nodes, about all their jobs, all their compute nodes, and all their active users.
    1. Are there unallocated compute nodes for all queued jobs?
    1. Otherwise, try to "steal" nodes from project clusters, to get more unallocated compute nodes. This "stealing" is done in two steps:

        - "drain" a certain node, i.e. disallow more jobs to start on it;
        - remove the compute node from the project cluster, if no jobs are running on the node.

    1. Use all unallocated nodes to create new compute nodes. Jobs with a higher priority get compute nodes first.

