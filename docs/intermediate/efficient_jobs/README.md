---
tags:
  - lesson
  - session
---

# Efficient jobs

!!!- info "Learning outcomes"

    - Practice using the UPPMAX documentation
    - I can see the CPU and memory usage of jobs
    - I can read a `jobstats` plot
    - I can create a `jobstats` plot
    - I understand how to set up jobs efficiently

???- question "Want to see this session as a video?"

    Watch the YouTube video
    ['Intermediate Bianca workshop: efficient jobs'](https://youtu.be/0FcREXUcOHc).

???- question "For teachers"

    Teaching goals are:

    - Learners have practiced using the UPPMAX documentation
    - Learners have seen the CPU and memory usage of jobs
    - Learners have read a `jobstats` plot
    - Learners have created a `jobstats` plot
    - Learners have discussed how to set up jobs efficiently

    Lesson plan:

    ```mermaid
    gantt
      title Efficient jobs
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

    - How to schedule jobs efficiently?
    - What is the `jobstats` tool?

    Present:

    - ?Show documentation

## Why?

!!! note "Quote from the UPPMAX documentation"

    If everyone would use our computational resources effectively,
    there would be no queue.
    
    > From the UPPMAX documentation, original source unknown

Running efficient jobs allows you to run more jobs that start running faster.

## What are efficient jobs?

Here we define an efficient job as a job that
makes good use of memory and processing power.

Each core you book gives both memory and processing power.

???- question "What is the relation between node, CPU and core again?"

    Here is a simplified picture of HPC cluster architecture:

    ```mermaid
    flowchart TD
      subgraph hpc_cluster[HPC cluster]
        subgraph node_1[Node]
          subgraph cpu_1_1[CPU]
          core_1_1_1[Core]
          end
        end
      end
    ```

    <!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

    Term               |What it loosely is                              |Amount
    -------------------|------------------------------------------------|---------------
    Core               |Something that does a calculation               |One or more per CPU
    CPU                |A collection of cores that share the same memory|One or more per node
    Node               |A collection of CPUs that share the same memory |One or more per HPC cluster
    HPC cluster        |A collection of nodes                           |One or more per universe
    The universe `[1]` |A collection of HPC clusters                    |One

    <!-- markdownlint-enable MD013 -->

    - `[1]` this is a pun to distributed parallelism

### Booking too many cores for memory is a reasonable thing to do

Memory is the most important resource of the two:
if you schedule too little memory, your calculation will crash.
This is worse than that your calculation will take longer.
You have already found out how much memory your calculations need
by trial-and-error :-) . You have probably been pragmatic
and booked too much cores, just to make sure that it works:
which is fine! In this session, we'll **visualize** how much cores
you actually need to book, so that you can confidently book less
cores per job, so that you can do more calculations that will start faster!

Here is a visualisation of a user that booked too many cores:

![Visualisation of a user that booked too many cores](jobstats_c_555912-l_1-k_bad_job_01_with_border.png)

### Booking more cores for quicker calculation speed may be useless

Programs can **sometimes** use multiple cores to speed up its calculation.
The idea is to let multiple cores each do their own part of the total
calculation. Such programs are called 'programs that allow parallel
computation'. In this session, I call these **multithreaded programs**, which
is a simplification that is not entirely technically correct.
Where multithreaded programs can use multiple cores,
**singlethreaded program** cannot. For singlethreaded programs,
booking more cores to speed up the calculation is useless.

Here is a visualisation of a user that booked multiple cores
for a singlethreaded program:

![Visualisation of a user that booked too many cores](jobstats_example_1.png)

### Booking more cores for quicker calculation speed may be wasteful

The most efficient use of core hours is having 1 core working on a calculation:

- The 1 core never needs to ask other cores if they are done
- The 1 core is never waiting for other cores to finish

If we book more cores to work on the same calculation there is **overhead**:

- The main core need to ask other cores if they are done
- Some cores need to wait for other cores to finish their part of the
  calculation

Overhead is wasted resources, hence you want to have overhead
for the right reasons. Good reasons are:

- You are in a hurry, so you need the calculation to go faster
- Your calculation takes 11 days, where Bianca allows jobs of maximimal
  10 days. Instead of dealing with an interruption, booking an extra core
  may solve the problem

When booking more cores -say twice as much- your program will not go
twice as fast. Below is a table of a worked-out example giving some numbers:

Program runtime                      |Number of cores|Time|Speedup|Efficiency
-------------------------------------|---------------|----|-------|----------
![1 core](amdahls_law_example_1.png) |1              |16  |100%   |100%
![2 cores](amdahls_law_example_2.png)|2              |10  |160%   |80%
![3 cores](amdahls_law_example_3.png)|3              |8   |200%   |60%
![4 cores](amdahls_law_example_4.png)|4              |7   |229%   |48%
![6 cores](amdahls_law_example_6.png)|6              |6   |267%   |33%
.                                    |12             |5   |320%   |18%
.                                    |24             |4.5 |356%   |9%
.                                    |48             |4.25|376%   |5%

The details behind this table can be found at
[the 'Parallel computing' session of the R-MATLAB-Julia course](https://uppmax.github.io/R-matlab-julia-HPC/advanced/parallel_computing/).

## Exercises

### Exercise 1: reading a `jobstats` plot

- Read [the UPPMAX `jobstats` documentation](https://docs.uppmax.uu.se/software/jobstats/)
  to know enough to be able to (practice) read a `jobstats` plot.
  Especially [the 'effective use' section](https://docs.uppmax.uu.se/software/jobstats/#efficient-use)
  is important.

#### Exercise 1.1: `jobstats plot 1`

See `jobstats plot 1` below and answer these questions:

- How much cores should this user book?
- Why?

!!! info "jobstats plot 1"

    ![jobstats plot 1](jobstats_c_555912-l_1-k_bad_job_01_with_border.png)

    > jobstats plot 1

???- question "Answer"

    The user should have booked 1 core: the memory use will work fine with
    1 core and this matches the CPU usage exactly.

    It may be that the program is set up incorrectly
    and that it can use multiple cores if set up correctly.

#### Exercise 1.2: `jobstats plot 2`

See `jobstats plot 2` below and answer these questions:

- Did the job finish successfully?
- How much cores should this user book?
- Why?

!!! info "jobstats plot 2"

    ![jobstats plot 2](jobstats_example_2.png)

    > jobstats plot 2

???- question "Answer"

    The job did not finish successfully, the `OUT_OF_MEMORY` error
    indicites that.

    How much cores the user should book is uncertain, we only know that it is
    more then currently used. One strategy is to double to amount of cores
    and finetune after a successful run.

#### Exercise 1.3: `jobstats plot 3`

- See `jobstats plot 3` below and answer these questions:
- How much cores should this user book?
- Why?

!!! info "jobstats plot 3"

    ![jobstats plot 3](jobstats_example_3.png)

    > jobstats plot 3

???- question "Answer"

    We don't know. The user uses all CPU power perfectly and
    there is enough memory available.

    The user may benefit from more CPUs, as the program may be
    CPU limited.

    It may be that the program used is designed to use
    20 CPUs maximally, hence scheduling 20 cores is perfect!

    It may be that using 20 cores is a strategy of the user:
    using multiple cores always brings computational overhead
    and hence wasted CPU resources.

#### Exercise 1.4: `jobstats plot 4`

See `jobstats plot 4` below and answer these questions:

- How much cores should this user book?
- Why?

!!! info "jobstats plot 4"

    ![jobstats plot 4](rackham-naiss2023-22-1014-fdube-50060711.png)

    > jobstats plot 4

???- question "Answer"

    This seems to be the cleanest example of using the algorithm to
    use computational resources efficiently: the user needs 2 cores
    for memory and adds 1 for safely. The job is not clearly
    CPU limited.

### Exercise 2: creating a `jobstats` plot

We are going to create a `jobstats` plot. For that, we need a job
to plot. Here we first look for a job, after which we plot it.

- Scan [the UPPMAX `finishedjobinfo` documentation](https://docs.uppmax.uu.se/software/finishedjobinfo/)
- Log in to **your own Bianca project**.
- Find a job that has finished successfully that took longer than one hour
  (if there is none, use the job the ran longest)

???- question "Answer"

    Here is a code snippet to find jobs that have completed:
    

    ```bash
    finishedjobinfo | grep COMPLETED
    ```

    Look for a job that has a high `runtime` value, such as the one below.
    The runtime must be above 5 minutes for this to work.

    ```bash
    2025-11-17 13:21:38 jobid=368 jobstate=COMPLETED username=richel account=sens2025560 nodes=sens2025560-b9 procs=1 partition=core qos=normal jobname=do_r_2d_integration.sh maxmemory_in_GiB=0.1 maxmemory_node=sens2025560-b9 timelimit=02:00:00 submit_time=2025-11-17T13:15:31 start_time=2025-11-17T13:15:52 end_time=2025-11-17T13:21:38 runtime=00:05:46 margin=01:54:14 queuetime=00:00:21
    ```

    Press `CTRL-C` to stop the process: it will take very long to finish.

- Read [the UPPMAX `jobstats` documentation](https://docs.uppmax.uu.se/software/jobstats/),
  create a `jobstats` plot of that job

???- question "Answer"

    Here is the general answer:

    ```bash
    jobstats --plot [job_id]
    ```

    For example:

    ```bash
    jobstats --plot 368
    ```


- `jobstats` has created a plot and saved it as file
  `bianca-[project_name]-[username]-[job_id].png`,
  for example, `bianca-sens2025560-sven-368.png`.
  Download the `jobstats` plot and view it.

???- question "Answer"

    Here is an example plot:

    ![The bianca-sens2025560-richel-368 plot](bianca-sens2025560-richel-368.png)

- Was that a job that was set up well? If not, how should it be setup? Why?

???- question "Answer"

    We don't know. The user uses all CPU power perfectly and
    there is enough memory available.

    The user may benefit from more CPUs, as the program may be
    CPU limited.

    It may be that the program used is designed to use
    all the scheduled cores maximally,
    hence scheduling that amount of cores is perfect!

    It may be that using less cores is a strategy of the user:
    using multiple cores always brings computational overhead
    and hence wasted CPU resources.

- Does the quote at the start of this sessions ('If everyone would use our
  computational resources effectively, there would be no queue') apply to
  the job you just investigated?

???- question "Answer"

    No.

???- question "How was the example plot generated?"

    Using the benchmark script from
    [the R-Julia-MATLAB course, session 'thread parallelism'](https://uppmax.github.io/R-matlab-julia-HPC/advanced/thread_parallelism/).
