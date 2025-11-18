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
- Ex. ``ml help python/3.9.5`` at UPPMAX

**Is it not there? Then proceed!**

!!! info

    **Methods:**

    - You can either just download a python package, transfer to ``wharf`` and Bianca and install there.
    - Install it on Rackham. Perhaps you need it here as well! Then transfer to ``wharf`` and Bianca local python library.
    - Make a virtual environment with one or several packages on Rackham. Then transfer to ``wharf`` and Bianca (any place).


## Users without access to Rackham/Pelle

- **NOTE** that if you install a package this way, you need to handle any dependencies yourself.

Use [transit](https://docs.uppmax.uu.se/cluster_guides/login_transit/)!

1. [Log in to transit](https://docs.uppmax.uu.se/cluster_guides/login_transit/)
2. [Go to the mounted project folder](https://docs.uppmax.uu.se/software/bianca_file_transfer_using_rsync/#3-mount-a-bianca-project)r
3. [Download](#download-on-transit) source files with ``wget``
4. Load R_packages of desired version (R is loaded on the fly)
5. Start R session
6. Install from source in R session

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

### Donwload on Transit

- Load the Python version you plan to use

``` sh
$ ml python/<version>
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
    - Ex. ``ml python/3.9.5``

```console
pip install --user --no-index --find-links /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560 <package-name>==<version>
```

- NOTE: you don't need the full naem of the ``.whl`` file!

### Test it in Python

- Start a python console

```console
python
```

- Import the package with ``import <package>``
- This should give no errors!


### Exercise

!!! question "Install ``numpy-2.0.0`` for Python/3.9.5


    ??? question "Answer"
    
        - Using Transit and how to navigate to the porject folder is shown above.
        - Load Python: ``ml python/3.9.5``
        - Download ``numpy-2.0.0``: ``pip download numpy==2.0.0``

        ??? question "How will that look like?"

            pip download numpy==2.0.0
            Collecting numpy==2.0.0
              Downloading numpy-2.0.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (19.3 MB)
                 |████████████████████████████████| 19.3 MB 18.5 MB/s
            Saved ./numpy-2.0.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
            Successfully downloaded numpy


        - Resulting file name: ``numpy-2.0.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl``
        
        On Bianca:
        
        ```console
        ml python/3.9.5
        pip install --user --no-index --find-links /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560 numpy=2.0.0
        ```

## Rackham users (will not work soon)

### Rackham

```sh
$ ml python/<version>
$ pip download <package-name>
```

### Transit set-up

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

- Download!

``` sh
$ pip download <package-name>
```

### Transfer to the ``wharf`` (only if Rackham)

```bash
sftp douglas@bianca-sftp
sftp> cd sens2017625/
sftp> dir
sftp>
```

If you have not uploaded anything to your ``wharf``, this will be empty. It might have a few things in it.

Now, upload to the `wharf` the package `<package-name>` and all the dependency packages `pip download` got you.

``` bash
sftp> put -r <package-name>
```

### Install on Bianca

On Bianca
install it (Yes, you can do it from this place) by telling pip where to look for packages and dependencies

- In this case i should have ended up in: ``/proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560``

``` sh
$ ml python
$ pip install --user --no-index --find-links /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560 <package-name>
```

**Then the package ends up in ``~/.local/lib/python<version>/site-packages/`` .**

!!! info "If many files or packages"

    you may want to tar before copying to include all possible symbolic links:

    ``` bash
    $ tar cfz <tarfile.tar.gz> <package>
    ```

    and in target directory (wharf_mnt) on Bianca:

    ``` bash
    $ tar xfz <tarfile.tar.gz> #if there is a tar file!
    $ mv –a  <file(s)> ~/.local/lib/python<version>/site-packages/
    ```

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

**Transfer to the ``wharf``**

``` bash
sftp douglas@bianca-sftp
sftp> cd sens2017625/
sftp> dir
sftp>
```

If you have not uploaded anything to your ``wharf``, this will be empty. It might have a few things in it.

``` bash
sftp> put -r <path>/projectB
```

**Move to site-packages folder**
On Bianca

``` bash
cd /proj/sens2025560/nobackup/wharf/bjornc/bjornc-sens2025560/
mv –a  projectB <path to any place, like project folder>
```


???- note "(Not tested for Transit) Install on Rackham/Transit and then transfer to Bianca"

    !!! info
        
        **The package ends up on  in ``~/.local/lib/python<version>/site-packages/`` .**

        - Note that `python<version>` is omitting the last number (bug fix), like `3.8` for `python-3.8.7`.

    !!! warning

        - If you don't have Rackham, try with Transit and tweak accoring to instruction for the download part above


    Install on Rackham/Transit

    ``` sh
    $ ml python/<version>        # this is to make use the correct python version and possible dependencies already available
    $ pip install --user <package-name>
    ```

    - If there is a requirements.txt file with the content of packages to be installed:

    ```bash
    pip install --user -r requirements.txt
    ```

    **Then the package(s) ends up in ``~/.local/lib/python<version>/site-packages/`` .**

    **Transfer to the ``wharf``**

    ``` bash
    sftp douglas@bianca-sftp
    sftp> cd sens2017625/
    sftp> dir
    sftp>
    ```

    If you have not uploaded anything to your ``wharf``, this will be empty. It might have a few things in it.

    - **Alt1: If you would like all your locally installed packages:**

    ``` bash
    sftp> put -r .local/lib/python<version>/site-packages/
    ```

    - **Alt 2: Just transfer the latest installed python package(s)**

    - Check what was installed. It may have been several dependency packages as well. Look at the times!

    ``` bash
    sftp>  lls -lrt .local/lib/python<version>/site-packages/
    ```

    ``` bash
    sftp> put -r .local/lib/python<version>/site-packages/<package name 1>
    # and if several packages
    sftp> put -r .local/lib/python<version>/site-packages/<package name 2>
    # and so on...
    ```

    **Move to site-packages folder**
    On Bianca

    ``` bash
    cd /proj/sens2025560/nobackup/wharf/bjornc/bjornc-sens2025560/
    mv –a  <file(s)> ~/.local/lib/python<version>/site-packages/
    ```

!!! error

    If problems arise, send an email to `support@uppmax.uu.se` and we'll help you.
