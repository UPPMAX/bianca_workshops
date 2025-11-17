---
tags:
  - lesson
  - session
---

# Installing R packages on Bianca

???+ question "Read through the content of Rapackages on Bianca in our documentation"

    ??? question "Can't you find it?"

        <https://docs.uppmax.uu.se/software/r_packages_bianca/>

## Exercise

!!! example "Example with Dowser 2.0.0"

    - <https://cran.r-project.org/web/packages/dowser/index.html>
    - just 2.4.0 is listed here
    - go to old sources/Dowser archive
    - choose 2.0.0.tar.gz
    - copy link
    - In project folder in **Transit**
    
    ```console
    wget https://cran.r-project.org/src/contrib/Archive/dowser/dowser_2.0.0.tar.gz
    ```

    - In **Bianca session** (right project!) and in wharf folder load ``R_packages`` and start R session
        
    - Ex: ``cd /proj/nobackup/sens2025560/wharf/bjornc/bjornc-sens2025560``

    ```console
    ml R_packages/4.3.1
    R
    ```

    In **R session**:

    ```R
    > install.packages("dowser_2.0.0.tar.gz", repos = NULL, type="source")
    ```
    
    - Type ``yes`` when asked about using a personal library.

    ??? question "Output"

        ```R
        Warning in install.packages("dowser_2.0.0.tar.gz", repos = NULL, type = "source") :
          'lib = "/sw/apps/R/4.3.1/rackham/lib64/R/library"' is not writable
        Would you like to use a personal library instead? (yes/No/cancel) yes
        Would you like to create a personal library
        ‘/castor/project/home/bjornc/R/x86_64-pc-linux-gnu-library/4.3’
        to install packages into? (yes/No/cancel) yes
        Installing package into ‘/castor/project/home/bjornc/R/x86_64-pc-linux-gnu-library/4.3’
        (as ‘lib’ is unspecified)
        Warning in untar2(tarfile, files, list, exdir, restore_times) :
          skipping pax global extended headers
        * installing *source* package ‘dowser’ ...
        ** using staged installation
        ** R
        ** data
        *** moving datasets to lazyload DB
        ** inst
        ** byte-compile and prepare package for lazy loading
        ** help
        *** installing help indices
        ** building package indices
        ** installing vignettes
        ** testing if installed package can be loaded from temporary location
        ** testing if installed package can be loaded from final location
        ** testing if installed package keeps a record of temporary installation path
        * DONE (dowser)
        >
        ```

    - Test it!

    ```R
    > library(dowser)
    Loading required package: ggplot2
    Registered S3 methods overwritten by 'treeio':
      method              from
      MRCA.phylo          tidytree
      MRCA.treedata       tidytree
      Nnode.treedata      tidytree
    ...
        
    ```  

