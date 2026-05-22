---
tags:
  - lesson
  - session
---

# Install with pip to Bianca

!!! info "Read through the content below"

??? question "Which transfer method is the best?"

    - Use Transit.
    - By this you get software modules of python, although with not exactly the same version.
    - You'll need a Python module to download the packages.

## Check for packages on Bianca

With a Python module loaded

- from the Python shell with the ``import`` command
- from BASH shell with the ``pip list`` command

You can also check the content of a module without loading it

- ``ml help python/3.10.8``

**Is it not there? Then proceed!**

## Procedures

Use [transit](https://docs.uppmax.uu.se/cluster_guides/login_transit/)!

1. [Log in to transit](https://docs.uppmax.uu.se/cluster_guides/login_transit/)
2. [Go to the mounted project folder](https://docs.uppmax.uu.se/software/bianca_file_transfer_using_rsync/#3-mount-a-bianca-project)
3. Load Python of desired version (IMPORTANT!)
4. [Download](pip.md#download-on-transit) with ``pip download``
5. On Bianca: Load Python of desired version (IMPORTANT!)
6. Do ``pip install``

You may benefit from using a ``requirements.txt`` file and virtual environment through ``python -m venv <environment name>``

### Transit

- **Log in to transit**: ``ssh <username>@transit.uppmax.uu.se``
    - [Documentation](https://uppmax.github.io/UPPMAX-documentation/cluster_guides/transfer_bianca/#transit-server)
- (If not done already) Mount the wharf of your project.

```bash
user@transit:~$ mount_wharf sens2025560
Mounting wharf (accessible for you only) to /home/<user>/sens2025560
<user>-sens2025560@bianca-sftp.uppmax.uu.se's password:
```

- Navigate to your wharf folder

```bash
cd sens2025560
```

### Download on Transit

- Be aware of that the module system on Transit is different from Bianca. Typical module name is ``Python/3.13.5-GCCcore-14.3.0``
- Load the Python version you plan to use. If you need 3.11.X it is sufficient to load a ``Python/3.11`` module, bug fix version matters less. This is to find compatible versions of the package.
- Note that Transit only covers Python versions 3.10 and higher.

??? question "Table of python version on Transit and Bianca"

    The table below tells which Python version you should load on Transit to be able to install for Bianca.
    
    Python version | Bianca | Transit
    -------------- | ------ | -------
    3.9 | 3.9.5 | -
    3.10 | 3.10.8 | 3.10.4-GCCcore-11.3.0
    3.11 | 3.11.8 | 3.11.5-GCCcore-13.2.0
    3.12 | 3.12.7 | 3.12.3-GCCcore-13.3.0
    3.13 | 3.13.1 | 3.13.5-GCCcore-14.3.0

``` sh
$ ml Python/<version>
```

- Download!

``` sh
$ pip download <package-name>==<version>
```

- You should get a ``.whl`` file

!!! warning "Transit has a newer system compared to Bianca"

    - A low-level library called **GLIBC** typicaly follows the OS installation.
    - GLIBC version on Bianca is 2.17
    - When downloading python packages on Transit you may get packages relying on GLIBC>2.17.
    - If you use them on Bianca you may get errors like:

    ```console
    ERROR: contourpy-1.3.3-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl is not a supported wheel on this platform.
    ```

!!! info "Solution"

    - add the options ``--platform manylinux_2_17_x86_64 --no-deps`` to the ``pip download`` command
        - Like ``pip download pillow==12.2.0 --platform manylinux_2_17_x86_64 --no-deps``

??? question "Interested in requirements files etc?"

    ```console
    pip --help
    ```

    ??? info "output"
    
        ```console
        Usage:
          pip download [options] <requirement specifier> [package-index-options] ...
          pip download [options] -r <requirements file> [package-index-options] ...
          pip download [options] <vcs project url> ...
          pip download [options] <local project path> ...
          pip download [options] <archive url/path> ...
        ```

    If you have a ``requirements.txt`` file already, upload it from local computer via e.g. ``sftp`` to Transit.

    - Download the python packages to a specific folder. Like

    ```console
    mkdir src_packages
    cd src_packages
    pip download -r requirements.txt  --platform manylinux_2_17_x86_64 --no-deps
    ```

    - ``--platform manylinux_2_17_x86_64`` will force the packages to be compatible with Bianca when instaling them there

### Installation part on Bianca

- Log in to Bianca and the relevant project
- Load the same python version (3.X, 3rd digit does not matter)
    - Ex. ``ml python/3.11.5``

```console
pip install --user --no-index --find-links /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560 <package-name>==<version>
```

- NOTE: you don't need the full name of the ``.whl`` file!

- **The package ends up automatically in ``~/.local/lib/python<version>/site-packages/`` .**

### Test it in Python

#### Alternative 1

In the bash session, do

```console
pip list
```

#### Alternative 2

- Start a python console

```console
python
```

- Import the package with ``import <package>``
- This should give no errors!

!!! info "Packages with dependencies"

    - Pandas is a typical packages that relies on specific version of numpy and also some other packages.
    - Downloading pandas as source also fetches the dependencies with compatible versions.
    
    ??? example

        ```console
        $ pip download pandas==2.2.2
        Collecting pandas==2.2.2
          Using cached pandas-2.2.2-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (13.0 MB)
        Collecting numpy>=1.22.4
          Using cached numpy-2.2.6-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (16.8 MB)
        Collecting python-dateutil>=2.8.2
          Using cached python_dateutil-2.9.0.post0-py2.py3-none-any.whl (229 kB)
        Collecting pytz>=2020.1
          Using cached pytz-2026.2-py2.py3-none-any.whl (510 kB)
        Collecting tzdata>=2022.7
          Using cached tzdata-2026.2-py2.py3-none-any.whl (349 kB)
        Collecting six>=1.5
          Using cached six-1.17.0-py2.py3-none-any.whl (11 kB)
        Saved ./pandas-2.2.2-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
        Saved ./numpy-2.2.6-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
        Saved ./python_dateutil-2.9.0.post0-py2.py3-none-any.whl
        Saved ./pytz-2026.2-py2.py3-none-any.whl
        Saved ./tzdata-2026.2-py2.py3-none-any.whl
        Saved ./six-1.17.0-py2.py3-none-any.whl
        Successfully downloaded pandas numpy python-dateutil pytz tzdata six
        ```

## Exercise

!!! question "Install ``numpy-2.1.0`` for general use in by you"

    - You want this in a 3.10 Python version on Bianca.
    - Download on Transit using a Python/3.10.X version
    - Install on Bianca using a Python/3.10.X version
    - Test if it works
    - Uninstall this package to not pollute your present general package library!

    ??? question "Answer"
    
        - Using Transit and how to navigate to the porject folder is shown above.
        - Find a Python version (major, minor) that goes together with the Bianca Python: ``ml av python``
            - We can choose between 3.10.4 and 3.10.8. Let's take the newest one and ``bare`` is sufficient for us.
        - Load Python: ``ml Python/3.10.8-GCCcore-12.2.0-bare``
        - Download ``numpy-2.1.0``: ``pip download numpy==2.1.0``

        ??? question "How will that look like?"

            ```console
            $ pip download numpy==2.1.0
            Collecting numpy==2.1.0
              Downloading numpy-2.1.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (16.3 MB)
                 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 16.3/16.3 MB 34.0 MB/s eta 0:00:00
            Saved ./numpy-2.1.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
            Successfully downloaded numpy
            ```

        - Resulting file name: ``numpy-2.1.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl``
        
        On Bianca:
        
        ```console
        ml python/3.10.8
 
        pip install --user --no-index --find-links /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560 numpy=2.1.0
        ```

        - Test it by starting python console and import and check version:
        
        ```console
        python
        ```
        
        ```python
        import numpy
        print(numpy.__version__)
        ```

        - If it works you can exit the python shell with ``CTRL+D``
        - Delete ``numpy-2.1.0`` from your local library

        ```console
        pip uninstall numpy==2.1.0
        ```

## Isolated/virtual environments and requirements files

### Introduction

!!! note

    Isolated environments (``venv`` solve a couple of problems):

    - You can install specific package, also older, versions into them.
    - You can create one for each project and no problem if the two projects require different versions.
    - You can use it as a sandbox to identify which versions go together
        - Like finding compatible versions of numpy and pandas
    - You can remove the environment and create a new one, if not needed or with errors.

- More information about [isolated environments](https://uppmax.github.io/HPC-python/extra/isolated_deeper.html).

!!! warning "You cannot reuse a virtual environment created on Transit on Bianca"

    - Doing ``venv`` on Transit will point to python with other paths compared to on Bianca. You cannot reuse that specific environment on Bianca.
    - BUT it can help identify which package versions goes together

### Procedure on Transit

- Make test environment venv311T with python-3.11 on Transit

```bash
module load Python/3.11.5-GCCcore-13.2.0
mkdir test_311
cd test_311
python -m venv venv311T
source venv311T/bin/activate
mkdir src_311
cd src_311
pip install matplotlib/3.9.2
```

- Make requirements file (should end up in ``test_311/src_311`` folder)

```console
pip freeze > requirements.txt
```

- You may now deactivate the environment: ``deactivate``
- Download and pick GLIBC<=2.17 (they should end up in ``test_311/src_311`` folder)

```console
pip download -r requirements.txt --platform manylinux_2_17_x86_64 --no-deps
```

### Procedure on Bianca side

- Go to the project folder you want to put your virtual environment.

```console
cd /proj/sens2025560/<your name>/
```

- Load Python and make a new virtual environment (``venv311B``, B for Bianca) for this project on Bianca and activate it

```console
ml Python/3.11.8
python -m venv venv311B
source activate venv311B/bin/activate
```

- This should give you the prompt ``(venv311B)``
- Locate the path to the requirements file and the source files for the packages.
- Alt 1: Go to that directory and install there

```console
cd /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560/test_311/src_311
pip install --no-index --find-links . -r requirements.txt 
```

- Alt 2: Include the path in the install command

```console
pip install --no-index --find-links /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560/test_311/src_311 -r /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560//test_311/src_311requirements.txt 
```

- Check with ``pip list``
- You may now deactivate the environment: ``deactivate``

## Exercise 2

!!! question "Follow the steps above"


!!! info "Summary installation principles"

    - Decide on a Python version to work with on Bianca

    Transit
    
    - Log in to Transit
    - (If not done already) Mount the wharf of your project.
    - Go to project directory
    - Load the relevant Python module
    - If you need to test versions
        - (Make a test isolated environment with ``pip -m venv <name of env>``
        - (Install right packages, possibly with pinned versions)
        - (freeze the environment and create a requirements file)
    - Download package (you may need to force those to be compatible with the old Bianca system)
        - ``pip download <package name>``
        - ``pip download -r <requirements file>``
    - You will get a ``.zip`` or ``.whl`` file for each package

    Bianca
    
    - On Bianca load the relevant python module
    - Make the installations from these files in wharf, either
        - Recommended: in a virtual environment in your real project folder.
            - the installation will end up in the folder of the virtual environment.
        - If you know what you are doing: to your local folder
            - everytime you start the python module these packages will show up for that version.

!!! error

    If problems arise, send an email to `support@uppmax.uu.se` and we'll help you.
