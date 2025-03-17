---
tags:
  - lesson
  - session
---

# Conda on Bianca

We have mirrored all major non-proprietary Conda repositories (not ``main``, ``anaconda`` and ``r``) directly on UPPMAX, on both Rackham and Bianca. These are updated every third day.

!!! info "Available Conda channels"

    - bioconda
    - biocore
    - conda-forge
    - dranew
    - free
    - ~~main~~
    - pro
    - qiime2
    - ~~r~~
    - r2018.11
    - scilifelab-lts
    - nvidia
    - pytorch

!!! warning

    - Good to change ``CONDA_ENVS_PATH`` to project folder, because of many small files.
    - Example: ``CONDA_ENVS_PATH=/proj/sens2025560/bjornc/conda``

???+ question "Read [Conda user guide](http://docs.uppmax.uu.se/software/conda/)"

    - Read [Conda user guide](http://docs.uppmax.uu.se/software/conda/)
        - skip [Working with Conda environments defined by files](http://docs.uppmax.uu.se/software/conda/#working-with-conda-environments-defined-by-files)

    - ONLY for the interested: [Working with Conda environments defined by files](http://docs.uppmax.uu.se/software/conda/#working-with-conda-environments-defined-by-files)
        - On bianca you have to get the `environments.yml` to wharf first!

## Exercises

!!! tip

    - You may want to have the same path for all conda environments in the present project
    - ``echo "export CONDA_ENVS_PATH=/a/path/to/a/place/in/your/project/" >> ~/.bashrc``
        - Example: ``echo "export CONDA_ENVS_PATH=/proj/sens2025560/bjornc/conda" >> ~/.bashrc``

!!! warning

    - It seems you are required to use this path, ending with the name of your environment, together with ``--prefix`` when you install new envronments AND packages also after activating the conda environment!
    Like: ``conda install --prefix $CONDA_ENVS_PATH/<your-environment> ...``


???+ question "Create a conda environment and install some packages"

    - First check the current installed packages while having `python/3.9.5` loaded

    - Open a new terminal and have the old one available for later comparison

    - Make sure **``python`` module** is **not active** in the new terminal

    - Start conda module

    - Make sure you have a folder in the project directory (`$USER` will automatically fill in you username. Handy!!)

    - ``mkdir /proj/sens2025560/$USER``

    - ``mkdir /proj/sens2025560/$USER/conda``

    - Set a CONDA_ENVS_PATH
        - Example: ``echo "export CONDA_ENVS_PATH=/proj/sens2025560/$USER/conda" >> ~/.bashrc``


    - Use the ``conda`` module on Bianca and the ``conda-forge`` channel to create an environment with name `bianca-course` with `python 3.7` and `numpy 1.15`

    - Use your a path for `CONDA_ENVS_PATH`

        - It may take a couple of minutes or so and do not forget to press `y` when asked for!

    - Activate!

    - Check with `pip list` what is there. Compare with the environment given from the python module in the first terminal window.

    - Which version of Python did you get?

    - Don't forget to deactivate the Conda environment before doing other exercises!


??? Solution for UPPMAX

    Write this in the terminal

    ``` sh
    $ module load conda
    ($ export CONDA_ENVS_PATH=/proj/sens2025560/$USER)
    $ conda create -c conda-forge --prefix $CONDA_ENVS_PATH/bianca-course python=3.7 numpy=1.15
    $ source activate bianca-course
    $ pip list
    $ python -V
    $ conda deactivate
    ```

    - It should show numpy=1.15 among others and the python version 3.7.X for the conda env


!!! abstract "keypoints"

    - Conda is an installer of packages but also bigger toolkits

    - Conda on Bianca is easy since the repos in the most used channels are local.

    - Conda creates isolated environments not clashing with other installations of python and other versions of packages

    - Conda environment requires that you install all packages needed by yourself, although automatically.

    - That is, you _cannot_ load the python module and use the packages therein inside your Conda environment.

