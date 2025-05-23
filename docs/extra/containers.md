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

Dockerhub

- <https://hub.docker.com>

- Search for ``gatk``
- Several ones  show up. the latest (and official "Broad institute" one) would be the best!
- <https://hub.docker.com/r/broadinstitute/gatk/>

Perfect!

| ![gatk_syslabs](./img/gatk_syslabs.png) | ![gatk_dockerhub](./img/gatk_dockerhub.png) |
|---|---|

- **Note that `apptainer` is not a module but available like a system tool!**
`apptainer pull gatk_4.3.0.0.sif docker://broadinstitute/gatk:4.3.0.0`

![apptainer_pull](./img/apptainer_pull.png)

`sftp` to the ``wharf``:

![sftp_gatk](./img/sftp_gatk.png)

`apptainer exec gatk_4.3.0.0.sif gatk`

![apptainer_gatk](./img/apptainer_gatk.png)

## Set the Apptainer cache dirs to /proj/proj-id to prevent quota issues

```bash
mkdir -p /proj/staff/bjornv/apptainer_cache_dir/{cache,tmp,localcache}
export APPTAINER_CACHEDIR=/proj/staff/bjornv/apptainer_cache_dir/cache
export APPTAINER_TMPDIR=/proj/staff/bjornv/apptainer_cache_dir/tmp
export APPTAINER_LOCALCACHEDIR=/proj/staff/bjornv/apptainer_cache_dir/localcache
```

!!! info "More info"

    Singularity course <!-- link was broken and hence removed -->
