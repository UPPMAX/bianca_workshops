---
tags:
  - lesson
  - session
---

# Containers

![Apptainer](./img/apptainer.png)

## Why?

Do you need a program that has a very complicated and exhausting install? Or maybe your installation requires root privileges?

Within a container you can install whatever you want and send it to whichever computer you want to run it from.

## How?

You can either download an existing container containing your software of interest or build one yourself.

## Docker vs Singularity/Apptainer

Docker requires root privileges and therefore are run on local computers or the cloud.

HPC-clusters without root privileges uses Apptainer.

## Public repositories

Dockerhub is the most common and has the biggest repository: <https://hub.docker.com/>

Apptainer/Singularity uses: <https://cloud.sylabs.io/library>
Luckily, **Apptainer can convert docker containers into Apptainer containers**.

Anyone can upload a container to the repositories. So be cautious and look for verified publishers.

## Learn more about containers

Read more on the Uppmax singularity workshop:
<https://pmitev.github.io/UPPMAX-Singularity-workshop/>

## Example: I want gatk on Bianca

Remember, no internet on Bianca. Build on other computer and then transfer the container to the ``wharf``.

- Gatk is developed by Broad institute

Can I find it on sylabs.io?

- <https://cloud.sylabs.io/>
- Search for ``gatk``

Well. It is there but broadinstitute is not there. Let's look for alternatives, otherwise we get back here!

- Continue to Dockerhub.

- <https://hub.docker.com>

- Search for ``gatk``
- Several ones  show up. the latest (and official "Broad institute" one) would be the best!
- <https://hub.docker.com/r/broadinstitute/gatk/>

Perfect!

| ![gatk_syslabs](./img/gatk_syslabs.png) | ![gatk_dockerhub](./img/gatk_dockerhub.png) |
|---|---|

- **Log in to transit**: ``ssh <username>@transit.uppmax.uu.se``
    - [Documentation](https://uppmax.github.io/UPPMAX-documentation/cluster_guides/transfer_bianca/#transit-server)
- (If not doen already) Mount the wharf of your project.

```bash
user@transit:~$ mount_wharf sens2025560
Mounting wharf (accessible for you only) to /home/<user>/sens2025560
<user>-sens2025560@bianca-sftp.uppmax.uu.se's password:
```

- Navigate to your wharf folder

```bash
cd sens2023531
```
  
- Disable Singularity cache

```bash
export APPTAINER_DISABLE_CACHE=true
export APPTAINER_TMPDIR=/dev/shm/$USER
mkdir -p $APPTAINER_TMPDIR
unset ${!NXF_*}
```
  
- You can get the container here directly with the "pull" command
- Run the command:

```bash
apptainer pull gatk_4.6.2.0.sif docker://broadinstitute/gatk:4.6.2.0
```

- In a Bianca session, navigate to the wharf

```bash
cd /proj/sens2025560/nobackup/wharf/$USER/$USER-sens2025560
```

- Move it to the project folder (good practice)

```bash
mv gatk_4.6.2.0.sif /proj/sens2025560/$USER/
```

- Go there

```bash
cd /proj/sens2025560/$USER/
```

- Run it:

```bash
`apptainer exec gatk_4.6.2.0.sif gatk`
```

It should give some output but it may give some warnings

![apptainer_gatk](./img/apptainer_gatk.png)

???- tip "Set the Apptainer cache directories to ``/proj/<proj-id>`` to prevent quota issues"

    ```bash
    mkdir -p /proj/sens2025560/$USER/apptainer_cache_dir/{cache,tmp,localcache}
    export APPTAINER_CACHEDIR=/proj/sens2025560/$USER/apptainer_cache_dir/cache
    export APPTAINER_TMPDIR=/proj/sens2025560/$USER/apptainer_cache_dir/tmp
    export APPTAINER_LOCALCACHEDIR=/proj/sens2025560/$USER/apptainer_cache_dir/localcache
    ```

!!! info "More info"

    [Singularity course](https://docs.uppmax.uu.se/courses_workshops/singularity/)
