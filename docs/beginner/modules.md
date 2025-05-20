---
tags:
  - lesson
  - session
---

# The module system

!!!- info "Learning outcomes"

    - Practice using the UPPMAX documentation
    - Understand why there is a module system
    - Can find pre-installed software using the module system
    - Can load a module
    - Practice loading the `bioinfo-tools` module first
    - Extra: Can find pre-installed software from the documentation
    - Extra: Can find pre-installed databases from the documentation

???- question "For teachers"

    Teaching goals are:

    - Learners have practiced using the UPPMAX documentation
    - Learners understand why there is a module system
    - Learners can find pre-installed software using the module system
    - Learners can load a module
    - Learners can unload a module
    - Learners understand to load the `bioinfo-tools` module first
    - Extra: Learners have found pre-installed software from the documentation
    - Extra: Learners have found pre-installed databases from the documentation

    Lesson plan:

    ```mermaid
    gantt
      title Modules
      dateFormat X
      axisFormat %s
      section First hour
      Prior : prior, 0, 5s
      Present: present, after prior, 2s
      %% It took me 9 mins, here I do that time x2
      Challenge: crit, challenge, after present, 18s
      %% Here I use the same time it took me to give feedback
      Feedback: feedback, after challenge, 9s
    ```

    Prior questions:

    - What would happen if all users would be allowed
      to install software on Bianca?
    - Describe a situation when two users that have admin rights
      on the same account of the same computer cannot both be happy
    - How can one run different versions of the same software
      on a same computer?
    - How can we have users use different versions of the same software?
    - What is the UPPMAX software module system?
    - What is a module?
    - Has anyone already used the UPPMAX module system?

## Why?

The module system allows you to run your software,
of your favorite version, installed by us :-)

Additionally, there are big databases (think terabytes!)
that are also available to you.

In this session, we'll search for pre-installed software,
pre-installed databases and use these.

## The `bioinfo-tools` module

The most important module for bioinformaticians is the `bioinfo-tools`
module. It is loaded as such:


```bash
module load bioinfo-tools
```

Only after loading it will some other tools appear.

## Exercises

???- question "Need a video?"

    The YouTube video
    ['Intro to UPPMAX Day 1: The module system'](https://youtu.be/ZuLMoZkGsZk) 
    shows the solution of these exercises

### Exercise 1: work with modules

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Find the UPPMAX documentation on modules

???- question "Answer"

    One can find the answer at
    <https://docs.uppmax.uu.se/cluster_guides/modules/>,
    where the module system is explained

- Search the module system for a tool called `cowsay` to find out
  in which module it is installed

???- question "Answer"

    Use `module spider` to search:

    ```bash
    module spider cowsay
    ```

- Load the latest version of the module for `cowsay`

???- question "Answer"

    After having used `module spider cowsay`, we've seen that the
    latest version is `3.03`. Hence we load the module like this:

    ```bash
    module load cowsay/3.03
    ```

- To confirm `cowsay` works, type `cowsay hello`. A cow that says 'hello'
  should appear

- Unload the module for `cowsay`

???- question "Answer"

    One does not need to add a version to unload a module:

    ```bash
    module unload cowsay
    ```

???- question "Answer"

- Confirm that `cowsay` does not work anymore,
  by typing `cowsay hello`. This should give an error

### Exercise 2: the `bioinfo-tools` module

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Load the `samtools` module, without loading the `bioinfo-tools` module
  (if you have loaded it, unload it).
  Which error message do you get?

???- question "Answer"


    <!-- Indeed, line lengths beyond 80 characters -->
    <!-- markdownlint-disable MD013 -->

    ```bash
    [sven@bianca1 ~]$ module load samtools
    Lmod has detected the following error:  These module(s) or extension(s) exist but cannot be loaded as requested: "samtools"
       Try: "module spider samtools" to see how to load the module(s).
    ```

    <!-- markdownlint-enable MD013 -->


- Do what is suggested, that is, do `module spider samtools`. Is the
  suggestion to load `bioinfo-tools` given there?

???- question "Answer"

    No:

    <!-- Indeed, line lengths beyond 80 characters -->
    <!-- markdownlint-disable MD013 -->

    ```bash
    [sven@bianca1 ~]$ module spider samtools

    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      samtools:
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         Versions:
            samtools/0.1.12-10
            samtools/0.1.19
            samtools/1.1
            samtools/1.2
            samtools/1.3
            samtools/1.4
            samtools/1.5_debug
            samtools/1.5
            samtools/1.6
            samtools/1.8
            samtools/1.9
            samtools/1.10
            samtools/1.12
            samtools/1.14
            samtools/1.16
            samtools/1.17
            samtools/1.19
            samtools/1.20
         Other possible modules matches:
            SAMtools

    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      To find other possible module matches execute:

          $ module -r spider '.*samtools.*'

    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      For detailed information about a specific "samtools" package (including how to load the modules) use the module's full name.
      Note that names that have a trailing (E) are extensions provided by other modules.
      For example:

         $ module spider samtools/1.20
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ```

    <!-- Indeed, line lengths beyond 80 characters -->
    <!-- markdownlint-enable MD013 -->


- Do `module spider samtools` to get help about the latest version. Is the
  suggestion to load `bioinfo-tools` given there?

???- question "Answer"

    Yes:

    <!-- Indeed, line lengths beyond 80 characters -->
    <!-- markdownlint-disable MD013 -->

    ```bash
    [sven@bianca1 ~]$ module spider samtools/1.20

    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      samtools: samtools/1.20
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        You will need to load all module(s) on any one of the lines below before the "samtools/1.20" module is available to load.

          bioinfo-tools

        Help:
           samtools - use samtools 1.20

           Version 1.20
    ```

    <!-- markdownlint-enable MD013 -->

Remember, whenever you cannot find something, do:

```bash
module load bioinfo-tools
```

### Extra: Exercise 3: find the software

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Find to list of installed software.
  Estimate how many pieces of software are installed on Bianca

???- question "Answer"

    One can find the answer at <https://docs.uppmax.uu.se/software/software-table/>,
    where one can find around 800 pieces of software installed

### Extra: Exercise 4: find the databases

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Find to list of databases.
  Estimate how many collections of databases are installed on Bianca

???- question "Answer"

    One can find the answer at <http://docs.uppmax.uu.se/databases/overview/>,
    where one can find around 7 collections of databases installed.

