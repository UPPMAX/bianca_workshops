---
tags:
  - lesson
  - session
---

# Install with pip to Bianca

???+ question "Read through the content below"

???+ question "Try to follow the steps with the package ``numpy==1.22.3`` for ``python/3.11.8`` "

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
- ``ml help python/3.9.5`` at UPPMAX

**Is it not there? Then proceed!**

!!! info
    **Methods:**

    - You can either just download a python package, transfer to ``wharf`` and Bianca and install there.
    - Install it on Rackham. Perhaps you need it here as well! Then transfer to ``wharf`` and Bianca local python library.
    - Make a virtual environment with one or several packages on Rackham. Then transfer to ``wharf`` and Bianca (any place).

## Only download on Rackham/Transit and install on Bianca

### Rackham

``` sh
$ pip download <package-name>
```

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
cd sens2023531
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
cd /proj/sens2023531/nobackup/wharf/bjornc/bjornc-sens2023531/
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
    cd /proj/sens2023531/nobackup/wharf/bjornc/bjornc-sens2023531/
    mv –a  <file(s)> ~/.local/lib/python<version>/site-packages/
    ```

!!! error

    If problems arise, send an email to `support@uppmax.uu.se` and we'll help you.
