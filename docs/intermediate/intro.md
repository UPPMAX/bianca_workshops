---
tags:
  - lesson
  - session
---

# Bianca In-Depth Hackathon: Improve Your Handling of Sensitive Research Data

!!!- info "Learning outcomes"

    - I have read the topics discussed today
    - I can find the link to the shared document
    - I can find the schedule

???- question "For teachers"

    Prerequisites are:

    - Link to shared document

    Teaching goals are:

    - Learners have read the topics discussed today
    - Learners can find the link to the shared document
    - Learners can find the schedule

    Prior questions:

    - What do you think about when you think about Bianca?
    - How would you like to improve your Bianca experience?

Are you already working with sensitive data in your research
and feel your workflow can be improved?
If yes, welcome to a full day of learning of smarter ways
to work on the Bianca UPPMAX cluster.

???- tip "Help! I am new to Bianca, where do I start instead?"

    As a beginner, you are encouraged to start with
    [the beginner Bianca course](../beginner/intro.md).

    This course assumes you have worked with Bianca for longer
    and there is no time scheduled to get a Bianca beginner up to speed.

!!! info "Course shared document"

    The course shared document can be found at:
    [https://hackmd.io/@UPPMAX/bianca-workshop-2024/edit](https://hackmd.io/@UPPMAX/bianca-workshop-2024/edit).

    It contains exercises, room for questions and room for feedback.

    To view the shared document in both text and rendered form,
    click on the button in the top between the pen and eye.

    Regarding questions:

    - create a new line for new questions
    - take care if others are editing at the same time
    - the more teaching assistants available, the quicker questions are answered
    - some questions may be answered after the workshop


- [Schedule](schedule.md)
- [Course dates](course_dates.md)

## Overview of courses

```mermaid
flowchart TD

    subgraph sub_basic_use["Basic use of Bianca"]
      can_login_to_remove_desktop(Can login to remote deskop)
      can_login_to_console(Can login to console)
      can_use_command_line_1(Can use the command line 1)
      can_use_modules(Can use modules)
      can_use_interactive_node(Can use an interactive node)
      can_manage_files_using_cli(Can manage files using CLI)
      can_tranfer_files_using_rsync(Can transfer files using rsync)
      can_schedule_jobs(Can schedule jobs)
      can_create_bash_script_using_cli(Can create a bash script using CLI)
    end

    subgraph sub_intermediate_use["Intermediate use of Bianca"]
      can_use_command_line_2(Can use the command line 2)
      can_run_efficient_jobs(Can run efficient jobs)
      can_run_jobs_on_gpu(Can run jobs on GPU)
      can_use_ide(Can use an IDE)
      can_tranfer_files_using_rsync2(Can transfer files using rsync)
      can_install(Can install software and packages)
    end

    subgraph sub_non_goal["Not in courses"]
      can_tranfer_files_using_gui(Can transfer files using GUI)
      can_create_bash_script_using_gui(Can create a bash script using GUI)
    end


    %% Basic
    can_login_to_console --> can_tranfer_files_using_rsync
    can_login_to_console --> can_use_command_line_1
    can_login_to_remove_desktop ---> can_use_command_line_1
    can_use_command_line_1 --> can_use_modules
    can_use_command_line_1 --> can_use_interactive_node
    can_use_command_line_1 --> can_use_command_line_2
    can_use_command_line_1 --> can_create_bash_script_using_cli
    can_use_command_line_1 --> can_schedule_jobs
    can_use_command_line_1 --> can_manage_files_using_cli
    can_use_command_line_1 --> can_tranfer_files_using_rsync
    can_use_modules --> can_schedule_jobs
    can_create_bash_script_using_cli --> can_schedule_jobs

    %% Basic -> Intermediate
    can_tranfer_files_using_rsync --> can_tranfer_files_using_rsync2
    can_schedule_jobs --> can_run_efficient_jobs
    can_schedule_jobs ---> can_run_jobs_on_gpu
    can_use_interactive_node --> can_use_ide
    can_use_modules --> can_use_ide
    can_tranfer_files_using_rsync2 -.-> |extra| can_tranfer_files_using_gui

    %% Make sure Intermediate is below Basic,
    %% using invisible nodes
    can_schedule_jobs ~~~ can_use_command_line_2

    %% Intermediate
    can_use_command_line_2 --> can_install

    %% Basic -> None
    %% can_login_to_remove_desktop ---> can_tranfer_files_using_gui
    %% can_tranfer_files_using_gui --> can_use_custom_software
    %% can_login_to_remove_desktop ---> can_create_bash_script_using_gui
    %% can_create_bash_script_using_gui --> can_schedule_jobs

    %% Make sure Non-goals is below Intermediat,
    %% using invisible nodes
    can_install ~~~ can_tranfer_files_using_gui
```

## Exercises

### Exercise 1: today's topic

In this exercise, we will find out today's learning objectives.

The goal of these questions is to introduce what is taught
today, as well as measuring how much knowledge is gained at the end
of the day.

- Fill in [this form](https://docs.google.com/forms/d/e/1FAIpQLSeXGoGlfFZpdmLEvfxlBq82IjaVwhz3kowXRT4ijsZe1bOWDA/viewform?usp=header)

???- question "What is in that form?"

    In this exercise, we will find out today's learning objectives.

    The goal of these questions is to introduce what is taught
    today, as well as measuring how much knowledge is gained at the end
    of the day.

    Give you confidence levels of the following statements,
    using this scale:

    - 0: I don't know even what this is about ...?
    - 1: I have no confidence I can do this
    - 2: I have low confidence I can do this
    - 3: I have some confidence I can do this
    - 4: I have good confidence I can do this
    - 5: I absolutely can do this!

    Give you confidence levels of the following statements below:

    - I can transfer files to/from Bianca using `rsync`
    - I can see the GPU and memory usage of jobs
    - I know the correct flags to utilize GPUs
    - I understand the GPU configuration on Bianca
    - I can see the CPU and memory usage of jobs
    - I understand how to set up jobs efficiently
    - I understand the principles how to install software and packages myself
    - I can install a Julia/Python/R packages myself
    - I understand what containers are
    - I can can run the voted-for IDE on Bianca
    - I understand how to deal with sensitive data

    Is there a learning objective you think is missing? What is it?

    ```code
    [Free text paragraph]
    ```
