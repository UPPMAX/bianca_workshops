---
tags:
  - lesson
  - session
  - login
  - log in
---

# Login

!!!- info "Learning outcomes"

    - Practice using the UPPMAX documentation
    - Get an UPPMAX 2FA
    - If needed: get a VPN
    - Understand that there are two environments
    - Understand that after login, one is on a login node
    - Understand what a login node is
    - Understand that on a login node, one only runs light commands

???- question "For teachers"

    Teaching goals are:

    - Learners have practiced using the UPPMAX documentation
    - Learners have gotten an UPPMAX 2FA
    - If needed, learners have installed a VPN
    - Learners have read and heard that there are two environments
    - Learners have read and heard that after login, one is on a login node
    - Learners have read and heard about what a login node is in general terms
    - Learners have practiced understanding what one runs on a login node

    Lesson plan:

    ```mermaid
    gantt
      title Login
      dateFormat X
      axisFormat %s
      section First hour
      Prior : prior, 0, 5s
      Present: present, after prior, 2s
      %% It took me 14 mins, here I do that time x2
      Challenge: crit, challenge, after present, 28s
      %% Here I use the same time it took me to give feedback
      Feedback: feedback, after challenge, 14s
    ```

    Prior questions:

    - What is 'HPC' in 'HPC cluster'?
    - What is 'cluster' in 'HPC cluster'?
    - Where are the UPPMAX HPC clusters?
    - When does one use an HPC cluster?
    - How does using an HPC clusters look like?
    - How does one tell the UPPMAX HPC clusters what to do?
    - Who has already logged in to an HPC cluster?
    - What does one need to be allowed to login to Bianca?
    - Who has already logged in to Bianca?

![Bianca or Rackham](./img/bianca_or_rackham.jpg)

> A human taking care of an UPPMAX HPC cluster

## Why?

To use any UPPMAX cluster, one needs to log in.
In this session, we learn there are multiple ways to login.
After logging in, one wants to behave considerate towards other users.

## Prerequisites

<!-- Indeed, line lengths beyond 80 characters -->
<!-- markdownlint-disable MD013 -->

It is assumed you have fulfilled all
[prerequisites for using Bianca](https://docs.uppmax.uu.se/getting_started/bianca_usage_prerequisites/).

<!-- markdownlint-enable MD013 -->

## Introduction

In this session, we warm up for using the UPPMAX HPC cluster
called Bianca. Here we introduce the first terms, such as 'HPC cluster'.

We will practice using the UPPMAX documentation,
so that you are confident that you can find what you need
and understand what is written.
Also, it helps UPPMAX staff find out how good our documentation is :-)

## Exercises

???- question "Need a video?"

    - [Exercise 1](https://youtu.be/eSn0kLkU5Dc)
    - [Exercise 2](https://youtu.be/J6hhEfW8-5w)

### Exercise 1: get an UPPMAX 2FA

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Where is it is described how to setup a 2FA for UPPMAX?

???- question "Answer"

    At <https://docs.uppmax.uu.se/getting_started/get_uppmax_2fa/>

- Which page does it link to?

???- question "Answer"

    To <https://www.uu.se/en/centre/uppmax/get-started/2-factor>

- Setup your UPPMAX 2FA

???- question "Answer"

    See [the 'Get your UPPMAX 2FA' YouTube video](https://youtu.be/eSn0kLkU5Dc)

Note that it takes 15 minutes before you can use this 2FA.

### Exercise 2: get inside university networks

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Where is it is described how to get inside the university networks?
  The formal name of these university networks is SUNET.

???- question "Answer"

    At <https://docs.uppmax.uu.se/getting_started/get_inside_sunet/>

- From that page, determine if you are inside the university networks.

???- question "How do I know if I am inside the university networks?"

???- question "Answer"

    Go to <https://bianca.uppmax.uu.se/>.

    - If nothing happens, you are outside of the university networks

    ![A user that is outside of the university network sees nothing](./img/login_uppmax_bianca_website_outside_sunet_browser_short.png)

    - If you so a login screen, you are inside of the university networks

    ![A user that is outside of the university network sees a login screen](./img/bianca_gui_login_1st.png)

    > A user that is outside of the university network sees a login screen

- If you are outside of the university networks, setup your VPN

???- question "Answer"

    This is described at
    ['Get inside the university networks' at the section 'Use a virtual private network'](https://docs.uppmax.uu.se/getting_started/get_inside_sunet/#use-a-virtual-private-network).

    Beyond this, it differs for users from different universities.

### Exercise 3: general understanding

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Where is it is described how to log in to Bianca?

???- question "Answer"

    It is at <https://docs.uppmax.uu.se/getting_started/login_bianca/>.

    You can reach this page by searching for
    'Login Bianca' or 'Log in Bianca'.

- How many environments can one log in to? How do they look like?

???- question "Answer"

    Two:

    - a remote desktop environment, which looks like a regular Linux computer
      with [the Xfce desktop environment](https://xfce.org/) installed

    - a console environment, which looks like text. No graphics. Text.

    These answers can be found at
    <https://docs.uppmax.uu.se/getting_started/login_bianca/>.

- The documentation of how to log in to Bianca states:
  'After logging in, one is on a login node'.
  What is a login node? Find it in the UPPMAX documentation

???- question "Answer"

    It is at <https://docs.uppmax.uu.se/cluster_guides/login_node/>.

    You can reach this page by searching for 'Login node' or click on the link
    in the documentation

- What is a login node?

???- question "Answer"

    From <https://docs.uppmax.uu.se/cluster_guides/login_node/>:

    > A login node is the computer where you arrive
    > after logging in to an UPPMAX HPC cluster

- Should the examples below be done on the Bianca login node?
  What is your reasoning?

    - Create a directory
    - Copy a dataset of 100 gigabytes to another folder
    - Download a dataset of 100 gigabytes
    - Edit a file using an IDE such as RStudio, VSCode or VSCodium
    - Edit a file using a simple text editor such as `emacs`, `nano` or `vim`
    - Run a bash/Nextflow/Python/R script

???- question "Answers"

    > - Create a directory

    Can be done on the Bianca login node, as this is a very light calculation
    that takes a very short time to run.

    > - Copy a dataset of 100 gigabytes to another folder

    Can be done on the Bianca login node, as this is a light calculation
    that takes a reasonable short time to run.

    > - Download a dataset of 100 gigabytes

    Can be done on the Bianca login node, as this is a light calculation
    that takes a reasonable short time to run.

    > - Edit a file using an IDE such as RStudio, VSCode or VSCodium

    Don't do this on a Bianca login node. These program
    need a lot of CPU and memory and are typically used for a long time.

    Instead, use an interactive session.

    > - Edit a file using a simple text editor such as `emacs`, `nano` or `vim`

    Can be done on the Bianca login node, as this is such a light calculation
    that it can be run for a long time.

    > - Run a bash/Nextflow/Python/R script

    This depends on what the script does:
    if it does a light calculation or takes a reasonable short time to run,
    you can run it on a login node.

    Else, you will have to use the Slurm job scheduler.
