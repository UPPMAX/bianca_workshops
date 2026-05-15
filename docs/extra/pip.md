---
tags:
  - lesson
  - session
---

# Install with pip to Bianca

???+ question "Read through the content below"

!!! info "Installation principle"

    - Log in to Transit
    - (If not done already) Mount the wharf of your project.
    - Go to project directory
    - Download package
        - ``pip download <package name>``
    - You will get a zip file for each package
    - From Bianca session move the file(s) to correct place
    - Typical place to put python packages: ``~/.local/lib/python<version>/site-packages/``

## Check for packages

- from the Python shell with the ``import`` command
- from BASH shell with the

- ``pip list`` command
- Ex. ``ml help python/3.10.8`` at UPPMAX

**Is it not there? Then proceed!**

!!! info

    **Methods:**

    - You can just download a python package on Transit with pip, then install from the ``.whl`` file in ``wharf`` on Bianca.
    - Rackham users: Install it on Rackham. Perhaps you need it here as well! Then transfer to ``wharf`` and Bianca local python library.

## Users without access to Pelle

- **NOTE** that if you install a package this way, you need to handle any dependencies yourself.

Use [transit](https://docs.uppmax.uu.se/cluster_guides/login_transit/)!

1. [Log in to transit](https://docs.uppmax.uu.se/cluster_guides/login_transit/)
2. [Go to the mounted project folder](https://docs.uppmax.uu.se/software/bianca_file_transfer_using_rsync/#3-mount-a-bianca-project)r
3. Load Python of desired version (IMPORTANT!)
4. [Download](pip.md#download-on-transit) with pip
5. On Bianca: Load Python of desired version (IMPORTANT!)
6. pip install



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

``` sh
$ ml Python/<version>
```

- Download!

``` sh
$ pip download <package-name>==<version>
```

- You should get a ``.whl`` file

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

### Installation part on Bianca

- Log in to Bianca and the relevant project
- Load the same python version
    - Ex. ``ml python/3.11.5``

```console
pip install --user --no-index --find-links /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560 <package-name>==<version>
```

- NOTE: you don't need the full name of the ``.whl`` file!

- **The package ends up in automatically in ``~/.local/lib/python<version>/site-packages/`` .**

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

### Exercise

!!! question "Install ``numpy-2.1.0`` for Python/3.10.8"


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

        - Test it by starting python colsole and improt and check version:
        
        ```console
        python
        ```
        
        ```python
        import numpy
        print(numpy.__version__)
        ```

!!! danger

    below needs cleaning

## Isolated/virtual environments

!!! tip

    - We HIGHLY recommend using a virtual environment during installation, since this makes it easier to install for different versions of Python.
    - However you can also create virtual environments on Bianca from downloaded packages, see above.

!!! note

    Isolated environments solve a couple of problems:

    - You can install specific package, also older, versions into them.
    - You can create one for each project and no problem if the two projects require different versions.
    - You can remove the environment and create a new one, if not needed or with errors.

- More information about [isolated environments](https://uppmax.github.io/HPC-python/extra/isolated_deeper.html).

Principle here:

- Download all packages on Transit and in relevant mounted SENS project folder
- Start an environment on Bianca and activate it and from there install the packages.


**Example, where python packages from the loaded module are used (``--system-site-packages``)**

``` bash
$ module load python/3.6.8
$ python -m venv --system-site-packages <path>/projectB
```

“projectB” is the name of the virtual environment. The directory “projectB” is created in the present working directory. The ``-m`` flag makes sure that you use the libraries from the python version you are using.

- Activate and install with pip (package one by one or from requirements.txt)

``` bash
$ source <path>/projectB/bin/activate
```

- Note that your prompt is changing to start with (analysis) to show that you are within an environment.
- Install the packages from the file::

```bash
$ pip install -r requirements.txt

$ pip list   # check
$ deactivate
```

- Virtual environments can be saved easily anywhere

    ``` sh
    $ ml python/<version>        # this is to make use the correct python version and possible dependencies already available
    $ pip install --user <package-name>
    ```

    - If there is a requirements.txt file with the content of packages to be installed:

    ```bash
    pip install --user -r requirements.txt
    ```

!!! error

    If problems arise, send an email to `support@uppmax.uu.se` and we'll help you.
