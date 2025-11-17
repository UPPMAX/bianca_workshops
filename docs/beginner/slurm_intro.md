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

## Why?

- You would want to use the compute capabilities on an HPC cluster
- You may on one hand want to work interactively with your data
- You may need to use much compute resources but can let this be done in the background

## Nodes and cores

???- question "What are those?"

    - Bianca contains hundreds of **nodes**.
    - Each node is like a ordinary **computer** without a screen.
    - One Bianca node consists of 16 **cores**.
    - Each core can do work more or less independently.
        - On a cluster, like Bianca, a [_thread_](https://en.wikipedia.org/wiki/Thread_(computing)) (sequence of programmed instructions) typically occupies one core.

There are two types of nodes:

Type          |Purpose
--------------|--------------------------
Login node    | Start jobs for worker nodes and do easy things/calculations. You share 2 cores and 15 GB RAM with active users within your SENS project.
Compute nodes | Do big calculations, either from scripts or an interactive session

???- info  "Principle"

    - Our nodes on Bianca have this principle

    ![node principle](./img/node.png)

    - Bianca have this principle

    ![nodes principle](./img/nodes.png)

## Slurm schedules and allocates compute resources for you

- Problem: _1000 users, 300 nodes, 5000 cores_
- We need a **queue** system:

    - [Slurm](https://slurm.schedmd.com/) is a job scheduler

### Two ways to allocate compute resources

- Work **interactively** with your data or develop or test
    - Run an **Interactive session**
    - Typical use cases: Run RStudio/matlab/stata
- If you _don't_ need any live interaction with your workflow/analysis/simulation
    - Send your job to the slurm job **batch** (sbatch)

???- tip "Decision maker"

    ```mermaid
    flowchart TD
        UPPMAX(What to run on which node?)
        operation_type{What type of operation/calculation?}
        interaction_type{What type of interaction?}
        login_node(Work on login node)
        interactive_node(Use on interactive session)
        calculation_node(Schedule for calculation node)

        UPPMAX-->operation_type
        operation_type-->|light,short|login_node
        operation_type-->|heavy,long|interaction_type
        interaction_type-->|Direct|interactive_node
        interaction_type-->|Indirect|calculation_node
    ```

???- info "What is a job"

    - Job = what happens during booked time

## Interactive jobs

!!! tip

    - When to use?
        - For development and programs that need responsiveness
    - Pros
        - Interactive jobs are high-priority
        - Quickly gives you a job and logs you in to the compute node
        - You run play with your data and do graphical analysis in real-time
        - You can develop and test your coming workflows to be run later as perfect batch jobs with larger data.

!!! warning

    - When to not use?
        - Most work is most effective as submitted jobs (batch)
    - Cons
        - Limited to 12 hours (?) and 2 nodes (32 cores)
        - CPU hours are ticking all the time the session is active, even if you do not perform any work

### Procedure for interactive jobs

- Log in to compute node via the terminal:

```bash
interactive -A [project name] -p core -n [number_of_cores] -t [session_duration]
```

- Do some work!
- Log out with `<Ctrl>-D` or `logout`

For example:

```bash
interactive -A sens2025560 -p core -n 2 -t 8:0:0
```

This starts an interactive session using project `sens2025560`
that uses 2 cores and has a maximum duration of 8 hours.

### Allocation flags/Slurm parameters

Example

- ``interactive -A sens2025560 -p core -n 4 -t 0:30:0``

!!! admonition "Slurm Cheat Sheet"

    - ``-A``    project number (**mandatory**)
    - ``-t``    estimated maximum time of job (**Default is 12 hrs for interactive session**)
    - ``-n``    number of cores (**Default is 1**)
    - ``-N``    number of nodes (can only be used if your code is parallelized with MPI)
    - ``-p``    partition
        - ``core`` is default and works for jobs narrower than 16 cores
        - ``node`` can be used if you need the whole node and its memory
        - for short development jobs and tests: ``devcore``, ``devel``)

- If in doubt:
    - `-p core`
    - `-n 1`, for Rstudio `-n 2`
    - `-t 10-00:00:00` (10 days)

???- info "Documentation"

    [Starting an interactive session on Bianca](https://docs.uppmax.uu.se/cluster_guides/start_interactive_session_on_bianca/)

!!! tip

    - (Re-)load modules in an interactive session
    - Check your working directory, ``pwd``. You are not automatically coming to ``~`` or you project folder.

## Job scripts (batch)

- A batch job is an instruction you give the job scheduler to perform.
- when submitted you will get a "job-id"
- The instruction is settled/finally defined when it has been sent to the job scheduler.
    - you can though ``cancel <job-id>`` the job, if you find out that you missed anything

!!! info "Typical content of batch script"

    - Slurm parameters (**flags**)
    - Load software modules
    - (Navigate in file system)
    - Run program(s)
    - (Collect output)
    - (... and more)

!!! tip

    - When to use?
        - Finished (and tested) automatic workflows where no interaction is needed
    - Pros
        - Very effective on CPU hours
        - Ends when the job is done
            - or if something goes wrong (hopefully)

!!! warning

    - When not to use?
        - When you need to interact or adjust settings during run
    - Cons
        - You have no interaction

### Procedure for batch jobs

- Batch scripts can be written in any scripting language. We will use **bash**
- Therefore, let the first line be  `#!/bin/bash -l`

???- question "Why ``-l``"

    - It is good practice to end the line with ``-l`` to reload a fresh environment with no modules loaded.
    - This makes you sure that you don't enable other software or versions that may interfere with what you want to do in the job.

- Before the job content, add the batch flags starting the lines with the keyword `#SBATCH`, like:
    - ``#SBATCH -A sens2025560``

???- question "Why initial``#``"

    - `#` will be ignored by `bash` and can run as an ordinary bash script
    - If running the script with the command `sbatch <script>` the `#SBATCH` lines will be interpreted as slurm flags

- Then add your workflow: An algorithm of the steps to be done from the terminal point of view.
    - Think about what you would have to do yourself in the terminal to:
        - run the tool in a login session from the terminal.
        - and do possible modification to allow for use of more cores


    ??? admonition "Slurm Cheat Sheet"

        Example

        - ``-A``    project number (**mandatory**)
        - ``-t``    estimated maximum time of job (**Default is 1 min only for batch**)
        - ``-n``    number of cores (**Default is 1**)
        - ``-N``    number of nodes (can only be used if your code is parallelized with MPI)
        - ``-p``    partition
            - ``core`` is default and works for jobs narrower than 16 cores
            - ``node`` can be used if you need the whole node and its memory
            - for short development jobs and tests: ``devcore``, ``devel``)

        - If in doubt:
            - `-p core`
            - `-n 1`, for Rstudio `-n 2`
            - `-t 10-00:00:00` (10 days)

!!! example "A (very) simple job script template"

    ```bash
    #!/bin/bash -l
    #SBATCH -A sens2025560  # Project ID
    #SBATCH -p core  # Asking for cores (for test jobs and as opposed to multiple nodes)
    #SBATCH -n 2  # Number of cores
    #SBATCH -t 00:1:00  # One minute
    #SBATCH -J Test  # Name of the job

    # go to some directory

    cd /proj/sens2025560/
    pwd -P

    # load software modules
    module load bioinfo-tools
    module list

    # do something
    hostname
    echo Hello world!
    echo Using the srun command: Running the same commands using the available cores
    srun hostname
    srun echo Hello world!
    ```

- Run it:

    - ``$ sbatch jobscript.sh``

- Note the job id!

- When job is done, depending on settings, there will be an output file called ``slurm-<job-id>.out``
- You can check the content with ``nano`` or ``cat``


- We _can_ modify the slurm parameters for tests from the command-line.
    - Like allocating 4 cores (instead 2 defined in the script)

    - ``$ sbatch -n 4 jobscript.sh``

???- info "Documentation"

    [sbatch a script with command-line Slurm parameters](https://docs.uppmax.uu.se/cluster_guides/slurm_on_bianca/#sbatch-a-script-with-command-line-slurm-parameters)


## Check the jobs

- `squeue` — quick info about jobs in (your project) in queue
- ``squeue --me`` — quick info about your jobs

## Exercises 30 minutes

??? question "Start an interactive session"

    - Ask for like 30 minutes and 2 cores and add ``--mail-type=BEGIN``

    - You will get an email when started so you don't miss some compute time!

    - Since it may take a while, continue with the other exercises!!

    !!! info "Documentation"

        [Starting an interactive session on Bianca](https://docs.uppmax.uu.se/cluster_guides/start_interactive_session_on_bianca/)

     ???- tip "Answer"

         ``$ interactive -A sens2025560 -p devcore -n 2 -t 30:00 --mail-type=BEGIN``


???+ question "You are developing code on Bianca."

    - You write the code line-by-line and schedule a test run after each addition.
    - However, after each new line, it takes a couple of minutes before you know your code worked yes/no.
    - How could you develop your code quicker?"

    ??? tip "Answer"

        - This is the typical use-case to use an interactive node.
        - One could also consider to develop code on a local computer instead (which uses nonsensitive/simulated/fake testing data) and upload the final code instead.

???- question "Why not always use an interactive session?"

    - Because it is an inefficient use of your core hours.
    - An interactive session means that you use a calculation node with low efficiency: only irregularly you will use such a node to its full
    capacity.
    - However, the number of core hours are registered as if the node is used at full capacity, as it is _reserved_ to be used at that capacity.

???+ question "Which approach is best in the following use cases? Batch jobs or interactive sessions?"

    1. Long jobs
    1. Short jobs with interactive "run-time"/interactive user input
    1. Short jobs without interactive "run-time"/interactive user input
    1. Test/debugging/developing code
    1. Playing with and plotting large data

    ??? tip "Answer"

        1. batch
        1. interactice
        1. batch
        1. interactive
        1. interactive


???- question "Use the interactive session"


    !!! tip

        - Wait with this if you have not got your resources yet!

    - When session is started, you can check which node you are from the information in your prompt, like:
        ``[bjornc@sens2025560-b9 ~]$``

    - Once the interactive job has begun after a while you need to **load needed modules**, even if you had loaded them before in the login node
    - Load an RStudio module and an R_packages module (if not loading R you will have to stick with R/3.6.0) and run "rstudio" from there.

        `$ ml RStudio/2023.06.2-561`

    - **Start rstudio**, keeping terminal active (`&`)

      `$ rstudio &`

    - **Quit RStudio**!
    - **Log out** from interactive session with `<Ctrl>-D` or `logout` or `exit`

???- question "Submit the slurm job above 'Example Slurm job'"

    - Create the script ``exampleBatch.sh`` by copy-pasting the content in 'A (very) simple job script template'
    - Send it to the queue

    !!! tip

    ![copy-paste](./img/copy_paste.png)

    !!! info "Documentation"

        [sbatch a script with command-line Slurm parameters](https://docs.uppmax.uu.se/cluster_guides/slurm_on_bianca/#sbatch-a-script-with-command-line-slurm-parameters)

    ???- tip "Answer"

        - ``nano exampleBatch.sh`` in a personal directory (home or in project)
        - insert the text above and save
        - ``sbatch exampleBatch.sh``

???- question "Monitor jobs"

    - Monitor all jobs with ``squeue`` command.
    - Monitor your jobs!
    - Do you find both the interactive session and the batch job?
    - Are they pending or active?

???- question "EXTRA: Play with some changes in the submit script used in the Type-along"

    - Write a bash script called ``jobscript.sh``
        - You can be in your `~` folder
    - To make it faster Copy-paste the code above.
    - Examples:
        - more cores
        - other things to do

???- question "EXTRA: Submit a complex Slurm job"

    - Make a batch job to run the [demo](https://uppmax.github.io/bianca_workshops/extra/slurm/) "Hands on: Processing a BAM file to a VCF using GATK, and annotating the variants with snpEff". Ask for 2 cores for 1h.
        - You can copy the my_bio_workflow.sh file in ``/proj/sens2025560/workshop/slurm`` to your home folder and make the necessary changes.

    ???- tip "Answer"

        - edit a file using you preferred editor, named `my_bio_worksflow.sh`, for example, with the content
        - alternatively copy the ``/proj/sens2025560/workshop/slurm/my_bio_workflow.sh`` file and modify it
          ``cd ~``
          ``cp /proj/sens2025560/workshop/slurm/my_bio_workflow.sh .``
        - edit ``my_bio_workflow.sh`` and add the SBATCH commands

        ```bash
        #!/bin/bash
        #SBATCH -A sens2025560
        #SBATCH -J workflow
        #SBATCH -t 01:00:00
        #SBATCH -p core
        #SBATCH -n 2

        cd ~
        mkdir -p myworkflow
        cd myworkflow

        module load bioinfo-tools

        # load samtools
        module load samtools/1.17

        # copy and example BAM file
        cp -a /proj/sens2025560/workshop/data/ERR1252289.subset.bam .

        # index the BAM file
        samtools index ERR1252289.subset.bam

        # load the GATK module
        module load GATK/4.3.0.0

        # make symbolic links to the hg38 genomes
        ln -s /sw/data/iGenomes/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.* .

        # create a VCF containing inferred variants
        gatk HaplotypeCaller --reference genome.fa --input ERR1252289.subset.bam --intervals chr1:100300000-100800000 --output ERR1252289.subset.vcf

        # use snpEFF to annotate variants
        module load snpEff/5.1
        java -jar $SNPEFF_ROOT/snpEff.jar eff hg38 ERR1252289.subset.vcf > ERR1252289.subset.snpEff.vcf

        # compress the annotated VCF and index it
        bgzip ERR1252289.subset.snpEff.vcf
        tabix -p vcf ERR1252289.subset.snpEff.vcf.gz
        ```

        - make the job script executable

        ```bash
        $ chmod a+x my_bio_workflow.sh
        ```

        - submit the job

        ```bash
        $ sbatch my_bio_workflow.sh
        ```

???+ question "EXTRA: Have look at the link below"

    - [The job scheduler graphically](https://docs.uppmax.uu.se/cluster_guides/slurm_scheduler/){:target="_blank"}

    - Which jobs will start faster?

## Ending remarks

!!! example "Discussion"

    - Discuss the exercise
    - Any further thoughts?

## The queue

!!! tip

    - You don't see the queue graphically.
    - But, overall:
        - short and narrow jobs will start fast
        - test and development jobs can get use of specific development nodes if they are shorter than 1 hour and uses up to two nodes.
        - waste of resources unless you have a parallel program or need all the memory, e.g. 128 GB per node

!!! note "See also"

    - [The job scheduler graphically](https://docs.uppmax.uu.se/cluster_guides/slurm_scheduler/){:target="_blank"}

### Core-hours

- Remember that you are charged CPU-hours according to booked #cores x hours
- Example 1: 60 hours with 2 cores = 120 CPU-hours
- Example 2: 12 hours with a full node = 192 hours
    - Waste of resources unless you have a parallel program using all cores or need all the memory, e.g. 128 GB per node
!!! admonition "See also"

    Intermediate workshop material on Slurm:

    - [complex jobs](../intermediate/complex_jobs.md)
    - [efficient jobs](../intermediate/efficient_jobs/README.md)
    - [replicate jobs](../intermediate/complex_jobs.md)

!!! admonition "Slurm Cheat Sheet"

    - ``-A``    project number
    - ``-t``    wall time
    - ``-n``    number of cores
    - ``-N``    number of nodes (can only be used if your code is parallelized with MPI)
    - ``-p``    partition
        - ``core`` is default and works for jobs narrower than 16 cores
        - ``node`` can be used if you need the whole node and its memory
            - must be used when allocating the fat nodes, see below
    - ``-C mem256GB`` allocate a fat node with 256 GB RAM
    - ``-C mem512GB`` allocate a fat node with 512 GB RAM
    - ``-C gpu``

    - **Batch jobs**

    - Two alternatives
        - ``sbatch <jobscript with all #SBATCH options>``
        - ``sbatch <options that will be prioritized over the options within the jobs script> <jobscript>``
            - can for instance be used if you just want to test with, for instance, fewer cores and shorter time
            - Example: ``sbatch -t  60:00 -p devcore -n 2 job.sh``

    - **Interactive**

    - ``interactive -A <project> <other options if not using default settings>``
    - load your modules when session starts

!!! admonition "Check and cancel jobs"

    - ``squeue``    see the pending and running jobs with their job IDs
    - ``scancel [job ID]``

## Links

- [New Slurm user guide](https://uppmax.github.io/UPPMAX-documentation/cluster_guides/slurm/){:target="_blank"}
- [Discovering job resource usage with `jobstats`](http://docs.uppmax.uu.se/software/jobstats/){:target="_blank"}
- [Plotting your core hour usage](http://docs.uppmax.uu.se/software/projplot/){:target="_blank"}
- [The job scheduler graphically](https://docs.uppmax.uu.se/cluster_guides/slurm_scheduler/){:target="_blank"}
- [Official slurm documentation](https://slurm.schedmd.com/){:target="_blank"}


!!! abstract "Keypoints"

    - Slurm is a job scheduler to handle the compute nodes
        - add flags to describe your job.
    - You are always in the login node unless you:
        - start an interactive session to do development or hands-on work
        - start a batch job to run jobs not needing any manual input
    - There is a job wall time limit of ten days (240 hours).
