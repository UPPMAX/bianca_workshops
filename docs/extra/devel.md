---
tags:
  - lesson
  - session
---

# Own development and Git on Bianca


## Install software yourself

- If not available on Bianca already (like Conda repositories) you may have to use the Wharf to install your tools
    - Alternatively let an Application Expert install the tool as a module.

!!! info Typical workflow for installation

    - Download the source code or binary (Linux on x86 and 64-bit) to Rackham first
    - Transfer to the wharf
    - Then, either
        - You can install in your home directory.
            - This is handy for personal needs, low numbers of files (i.e. not Conda).
        - Usually better to install in project directory.
            - This way the project contains both data and software — good for reproducibility, collaboration, and everyone's general sanity.
    - Binaries for Linux on x86 and 64-bit should be able to be run directly as it is, see the software specific installation documentation.
    - or build from source, see next session.


### Build from source

- To build from source use a compiler module
- We have several compiler versions from GNU and INTEL
- check with: ``$ ml avail gcc`` and ``$ ml avail intel``
- [Guide for compiling **serial** programs](https://docs.uppmax.uu.se/software/compiling_serial/){:target="_blank"}
- [Guide for compiling **parallel** programs](https://docs.uppmax.uu.se/software/compiling_parallel/){:target="_blank"}

## Git on Bianca

- You may develop code on Bianca with a local repo.
- However, to push to GitHub, you have to manually copy your git repo via the ``wharf`` to another place, like
    - local computer or Rackham.
    - ... and from there push to GitHub.
- ... and conversely pulling from remote to local with internet connection
    - and transfer back to Bianca via ``wharf``
- A little cumbersome but doable!

- For collaboration within a ``sens`` project your can have a "local" ``remote`` repo in your common project folder.
- [More on Git on Bianca](https://docs.uppmax.uu.se/software/git_on_bianca/)
