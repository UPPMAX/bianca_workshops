---
tags:
  - exercise
---

# Exercises

!!! info

    We put some exercises here for you, if you want to get some more hands-on.

## Working with modules

???+ question "View in IGV"

    - Load the genome, the bam file, and the annotated *vcf* that we got from the [demo](https://uppmax.github.io/bianca_workshops/beginner/modules/) into IGV for viewing

        ??? tip "Answer"

            For this small example we use ``igv-core``. Good is also to be on a compute node.

            ```bash
            $ ml bioinfo-tools IGV
            $ igv-core --genome genome.fa
            ```

            Then open ERR1252289.subset.bam ERR1252289.subset.snpEff.vcf.gz from the GUI.

## Transferring files

???+ question "Copy files between to Sens projects"

    - Use the Transit server to copy a file (e.g. the interactive session script) from the Bianca workshop project to another project, if you belong to one.

        ??? tip "Answer"

            1. Connect to transit
            2. Mount the projects with mount_wharf
            3. Move/copy the file(s) from sens2025560 to your other project
            4. Log in to the other Sens project on Bianca and move the file from the wharf to a good place

## Using the compute nodes

???+ question "Submit a Slurm job"

    - Make a batch job to run the [demo](https://uppmax.github.io/bianca_workshops/beginner/modules/) "Hands on: Processing a BAM file to a VCF using GATK, and annotating the variants with snpEff". Ask for 2 cores for 1h.

    ??? tip "Answer"

        - edit a file using you preferred editor, named `my_bio_worksflow.sh`, for example, with the content

        ```bash
        #!/bin/bash
        #SBATCH -A sens2025560
        #SBATCH -J workflow
        #SBATCH -t 01:00:00
        #SBATCH -p core
        #SBATCH -n 2


        cd /proj/sens2025560/workshop/slurm/

        module load bioinfo-tools

        # load samtools
        module load samtools/1.17

        # copy and example BAM file****
        cp -a /proj/sens2025560/workshop/data/ERR1252289.subset.bam .

        # index the BAM file
        samtools index ERR1252289.subset.bam

        # load the GATK module
        module load GATK/4.3.0.0

        # make symbolic links to the hg38 genomes
        ln -s /sw/data/iGenomes/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.* .

        # create a VCF containing inferred variants
        gatk HaplotypeCaller --reference genome.fa --input ERR1252289.subset.bam --intervals chr1:100300000-100800000 --output ERR1252289.subset.vcf

        # use snpEFF to annotate variants
        module load snpEff/5.1
        java -jar $SNPEFF_ROOT/snpEff.jar eff hg38 ERR1252289.subset.vcf > ERR1252289.subset.snpEff.vcf

        # compress the annotated VCF and index it
        bgzip ERR1252289.subset.snpEff.vcf
        tabix -p vcf ERR1252289.subset.snpEff.vcf.gz
        ```

        - make the job script executable

        ```bash
        $ chmod a+x my_bio_workflow.sh
        ```

        - submit the job

        ```bash
        $ sbatch my_bio_workflow.sh
        ```

## Doing installations

### Rpackage installation

???+ question "Install dowser"

    - Install the package ``dowser`` on Rackham and use sftp to get it to Bianca.
    - [Dowser on ReadTheDocs](https://dowser.readthedocs.io/en/latest/){:target="_blank"}

    ??? tip "Answer"

        [Dowser exercise](https://uppmax.github.io/bianca_workshops/extra/rpackages/#example-update-dowser)

### Conda installation

???+ question "Install with Conda directly on Bianca"

    - Install ``python=3.7`` and ``numpy=1.15`` with Conda directly on Bianca.

    ??? tip "Answer"

        <https://uppmax.github.io/bianca_workshops/extra/conda/#exercises>


### Pip installation with virtual environment

???+ question "Install with pip"

    - Make a virtual environment (confer this [tutorial](https://uppmax.github.io/R-python-julia-matlab-HPC/python/isolated.html)) with ``python/3.8.7`` on Rackham and install ``numpy==1.18.1`` and ``matplotlib==3.1.3``. Use ``sftp`` to get it to Bianca.


    ??? tip "Answer"

        <https://uppmax.github.io/bianca_workshops/extra/pip/#isolatedvirtual-environments>


### Julia installation

???+ question "Install a Julia package"

    - Install ``Gumbo`` in the julia packager [tutorial](https://docs.uppmax.uu.se/software/julia/). Use `sftp` to get it to Bianca.


    ??? tip "Answer"

        <https://uppmax.github.io/bianca_workshops/extra/julia/#install-yourself>


### Singularity/Apptainer

???+ question "Install gatk on bianca with Apptainer"

    - Use the docker image for ``gatk/4.3.0.0`` and install on Rackham and transfer to Bianca.

    ??? tip "Answer"

        <https://uppmax.github.io/bianca_workshops/extra/containers/#example-i-want-gatk-on-bianca>
