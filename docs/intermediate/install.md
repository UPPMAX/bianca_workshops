---
tags:
  - lesson
  - session
  - package
  - software
  - installation
  - conda
  - pip
  - R
  - python
  - docker
  - apptainer
  - singularity
  - 
---

# Package and software installation on Bianca

!!! info "Learning Objectives"

    Learners

    - understand _principles_ how to install software and packages yourself
    - can install packages of *one or several* types
        - Python packages using conda
        - Python packages using pip
        - R packages
        - Julia packages
    - understand what containers are
    - The learners have explored the UPPMAX documentation

    - (optional) can install software using a container
    - (optional) can build software from source

???- info "Notes for teachers"

    Teaching goals:

    - See above
    Lesson plan:

    ```mermaid
    gantt
      title IDEs
      dateFormat X
      axisFormat %m
      Introduction: intro, 0, 10m
      Vote on wih IDE: vote, after intro, 5m
      Exercise with personal favorite package: crit, exercise, after vote, 20m
      Feedback: feedback, after exercise, 10m
      Installing software and developing: monologue, after feedback, 5m
      Break: milestone, after monologue
    ```

## The module system

???- tip "Forgot how to use the module system?"

    See [the basic Bianca course page 'Using the module system'](../beginner/modules.md).

- **Lots of programs and tools installed as modules** on Bianca.
    - You can **request installations** but that **may take several days or weeks** to be handled by the application experts at UPPMAX.
    - Workflow: Application expert installs on Rackham and it is synced over to Bianca within a day.
- **Installations yourself**.
    - Workflow: use the **``wharf`` to transfer installation files and packages to Bianca from Rackham or other place**. Here the use of Rackham comes handy because
        - of the internet connection.
        - the computer architecture is somewhat similar such that precompiled binaries or compiled programs (x86_64) on Rackham will most often work also on Bianca.

## Content

- Principles of installing packages on Bianca
- Exercise: test yourself in EITHER
    - R
    - Conda
    - Python/pip
    - Julia
- Feedback
- Principles of software installation on Bianca
    - From source
    - From binary
    - Containers
- Development and Git on Bianca

## Packages and libraries to scripting programs

- Python, R and Julia all have some **centrally installed packages** that are available from the modules.
- R has a special module called ``R_packages``, and some Machine Learning python packages are included in the ``python_ml_packages`` module.
- If not found there you can try to install those by yourself.


### Check packages

!!! admonition "R"

    ``$ ml R_packages/4.3.1``

    Then within R, try loading the package you want, like ``glmnet``:

    ``library(glmnet)``

!!! admonition "Python"

    - Check **python versions**: ``ml avail python``
    - Check **python packages/modules**

        1. **help** output from: ``ml help python/3.12.7``
        2. In a loaded python

            - **Load** a python version, like: ``ml python/3.11.8``
            - from **Python shell** with the ``import`` command
            - from **BASH shell** with the ``pip list`` command

!!! admonition "Julia"

    - At UPPMAX there is a central library with installed packages.
    - This is good, especially when working on Bianca, since you then do not need to install via the ``wharf``.
    - It is often better to install you own, see below, or ask the support to install centrally.

    - Check **julia versions**: ``ml avail julia``
    - Check **julia packages/modules**

        1. **help** output from: ``ml help julia/1.9.3``
        2. In a loaded julia

            - **Load** a python version, like: ``ml julia/1.8.5``
            - from **julia shell** with the ``using`` command

### Install packages, principles

!!! info "Installation principle"

    - Install on Rackham or other place
    - Sync to ``wharf``
    - Move the files on Bianca to a place in the path used for packages of R, Python (pip) or julia

!!! admonition "R"

    - Typical place to put R packages: ``~/R``
    - Otherwise you may have to update your ``R_LIBS_USER="<path>"``

    Links:

    - [Extra material: Installing R packages](https://uppmax.github.io/bianca_workshops/extra/rpackages/)
    - [From R course: packages](https://uppmax.github.io/R-python-julia-matlab-HPC/r/packagesR.html){:target="_blank"}
    - [From R course: isolated environments](https://uppmax.github.io/R-python-julia-matlab-HPC/r/isolatedR.html){:target="_blank"}

!!! admonition "pip (PyPI)"

    - Typical place to put python packages: ``~/.local/lib/python<version>/site-packages/``
    - Otherwise you may have to update ``PYTHONPATH="<path>"``

    Links:

    - [Extra material: Installing pip packages](https://uppmax.github.io/bianca_workshops/extra/pip/){:target="_blank"}
    - [UPPMAX Python user guide: Pip](http://docs.uppmax.uu.se/software/python_install_packages/#pip){:target="_blank"}
    - [From Python course: packages](https://uppmax.github.io/R-python-julia-matlab-HPC/python/packages.html){:target="_blank"}
    - [From Python course: isolated environments](https://uppmax.github.io/R-python-julia-matlab-HPC/python/isolated.html){:target="_blank"}

!!! info "Tip Python packages"

    - Try Conda first directly on Bianca. We have mirrored all _major_ Conda repositories directly on UPPMAX, on both Rackham and Bianca. These are updated every third day.
    - If you want to keep number of files down, use PyPI (pip), but then you need to use Rackham and the ``wharf``.

!!! admonition "Conda"

    - We have mirrored the non-proprietary Conda repositories (not ``main``, ``anaconda`` and ``r``) directly on UPPMAX, on both Rackham and Bianca. These are updated every third day.
    - Good to change ``CONDA_ENVS_PATH`` to project folder, because of many small files.
    - Example: ``CONDA_ENVS_PATH=/proj/sens2025560/bjornc/conda``

    Links:

    - [Extra material: Installing Conda packages](https://uppmax.github.io/bianca_workshops/extra/conda/)
    - [Conda user guide](http://docs.uppmax.uu.se/software/conda/)

!!! admonition "Julia"

    - Typical place to put julia packages: ``~/.julia/packages``
    - Otherwise you may have to update ``export JULIA_LOAD_PATH="path1:path2:..."``

    Links:

    - [Extra material: Installing Julia packages](https://uppmax.github.io/bianca_workshops/extra/julia/){:target="_blank"}
    - [UPPMAX julia user guide: Pip](http://docs.uppmax.uu.se/software/julia/){:target="_blank"}
    - [Julia course: isolated environments](https://uppmax.github.io/R-python-julia-matlab-HPC/julia/isolatedJulia.html){:target="_blank"}
    - :warning: contact [NAISS support](javascript:void(window.open('https://supr.naiss.se/support/?centre_resource=c4%27,%27_blank%27,%27toolbar=1,location=1,status=1,menubar=1,scrollbars=1,resizable=1%27));) for individual help!

## Exercise 20 min

???+ question "Pick one of the following topics!"

    - Read the introduction with a demo and use it to solve the exercise in the end.
    - "Containers" contains less material but may take time to install.

    - [Extra material: Installing Conda packages](https://uppmax.github.io/bianca_workshops/extra/conda/){:target="_blank"}
    - [Extra material: Installing pip packages](https://uppmax.github.io/bianca_workshops/extra/pip/){:target="_blank"}
    - [Extra material: Installing R packages](https://uppmax.github.io/bianca_workshops/extra/rpackages/){:target="_blank"}
    - [Extra material: Containers](https://uppmax.github.io/bianca_workshops/extra/containers/){:target="_blank"}

    - One breakout room per topic: Help each-other!

!!! discussion

    - Did it work out well?
    - Any questions?
    - Any input?

## Install software yourself

- If not available on Bianca already (like Conda repositories) --> use the ``wharf`` to install your tools

!!! note "Typical workflow for installation"

    - **Download** the
        - _source_ code or
        - _binary_ (Linux on x86 and 64-bit)
    - **Transfer** to the ``wharf``
    - Move file(s) to either
        - ``$HOME`` directory.
            - Handy for personal needs and low numbers of files — i.e. not Conda.
            - Example python/R/julia packages.
        - Usually better to install in project directory.
            - This way the project contains both data and software
            - Good for reproducibility, collaboration, and everyone's general sanity.
    - Then, either:
        - Binaries for Linux on x86 and 64-bit should be able to be run directly as they are.
        - Install program following instructions from documentation of the software.

### Build from source (C/C++ and Fortran)

- To build from source use a **compiler module**
- We have several compiler versions from GNU and INTEL
- ``make`` is installed on the system
    - :warning: It could happen that the "Makefile" contains web fetching, which will not work from Bianca.
    - Usually it is not a problem to build on Rackham and move to Bianca.
- ``cmake`` is available as module

!!! info "More info"

    - [Extra material: Build from source](../extra/source_install.md)
    - [Singularity course](https://pmitev.github.io/UPPMAX-Singularity-workshop/)

### Containers

- Containers let you install programs without needing to think about the computer environment, like
    - operative system
    - dependencies (libraries and other programs) with correct versions


![Containerization](img/Containerization_nextlabs.png)

> From [Nextlabs](https://www.nextlabs.com/what-is-containerization/)

!!! info

    - 2(3) types

        1. Singularity/Apptainer perfect for HPC systems
        2. Docker that does not work on HPC-systems

            - But docker images can be used by Singularity and Apptainer

    - Everything is included
    - Workflow:

        - Download on Rackham or local computer
        - Transfer to Bianca
        - Move to from wharf to any place in your working folders on Bianca

    - Draw-backs

        - you install also things that may be already installed
        - therefore, probably more disk space is needed

!!! info "More info"

    - [Extra material: Containers](https://uppmax.github.io/bianca_workshops/extra/containers/)
    - [Singularity course](https://docs.uppmax.uu.se/courses_workshops/singularity/)

## Own development and Git

- [Own development and git](https://uppmax.github.io/bianca_workshops/extra/devel/)

!!! abstract "Keypoints"

    - You have got an overview of the procedures to install packages/libraries and tools on Bianca through the ``wharf``
    - If you feel uncomfortable or think that many users would benefit from the software, ask the support to install it.
