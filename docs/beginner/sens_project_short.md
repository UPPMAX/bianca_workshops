---
tags:
  - lesson
  - session
  - NAISS
  - sens
  - legal
  - sensitive
---

# Intro to NAISS-SENS

!!! info "Objectives"

    - Information security
    - Legal guidance
    - A discussion of NAISS SENS projects, proposals, and allocations

This page summarises the content of
[this presentation](https://github.com/UPPMAX/bianca_workshops/blob/main/docs/beginner/presentations/bianca_legal_and_admin.pdf).

## Sensitive personal data

- Personal data: Traced to now living persons, e.g.
        - Name
        - Address
        - Food preference
        - Size of left nostril

- Sensitive personal data:
        - ethnic origin
        - political opinion
        - religious or philosophical beliefs
        - trade union membership
        - health
        - sex life
        - genetic data
        - biometric data that can uniquely identify a person
                - including some image or auditory recordings

- More about sensitive personal data
    - [IMY](https://www.imy.se/en/)
    - [GDPR](https://www.gdpr.eu/)
    - [Data protection](https://ec.europa.eu/info/law/law-topic/data-protection_en)
    - [Skydd av personuppgifter](https://ec.europa.eu/info/law/law-topic/data-protection_sv)
    - [SND](https://snd.gu.se/sv/hantera-data/planera/forskningsdata-med-personuppgifter)

- When in doubt, contact your university's [data protection officer](https://www.uu.se/en/centre/uppmax/get-started/create-account-and-apply-for-project/apply-for-projects/applying-for-naiss-sens-project/sensitive--data), legal department, and/or security department.

- Other sensitive data:
        - Confidential information
                - e.g. IP from private industry
        - Secrets
                - sensitive environmental data, e.g. protected species
        - National security

- A Data Protection Impact Assessment (DPIA) is legal requirement for any project with GDPR-data.

- If in doubt (especially with "new" data type), also do a information security evaluation to determine how you should handle the data.

## Pseudonymisation and anonymisation

- Anonymised: no theoretical way at all to determine an individual
- Pseudonymised: anything less

Pseudonymisation is a security mechanism that improves the security of sensitive personal data. *The data is still sensitive*.

But how do you know whether data is anonymised?

- "It depends..."
- Some data cannot be anonymised at all (e.g. whole genome sequence)
- One metric for micro data is [K-anonymity](https://en.wikipedia.org/wiki/K-anonymity)

## Making sensitive data FAIR

FAIR means Findable, Accessible, Interoperable, and Reusable. These are qualities that are important for maximising the value of data in research.

Sensitive data can be made FAIR. Even though you cannot publish it freely and openly online, you can (and should):

- Publish **open** metadata, with clear access conditions to the underlying data.

## Apply for project

- [Detailed instructions for project application](https://www.uu.se/en/centre/uppmax/get-started/create-account-and-apply-for-project/apply-for-projects/applying-for-naiss-sens-project)
[NAISS SENS Rounds](https://supr.naiss.se/round/open_or_pending_type/?type=NAISS+SENS)
- Before GDPR-data will be transferred to UPPMAX, there must be a [Data Processing Agreement](https://www.uu.se/en/centre/uppmax/get-started/create-account-and-apply-for-project/apply-for-projects/applying-for-naiss-sens-project/puba) between UU and the data controlling organisation. These are currently specific to the PI (and sometimes project).

!!! note "Some definitions"

    - Project: A collection of resource allocations and people, with an expiration date.
    - Compute resources: CPU time used by submitted jobs.
    - Storage resources: GB of disk space. /proj has backup, /proj/no-backup has no backup.
    - Allocation: The amount of resources a project may consume before hitting a limit.

- Take home message: follow the above instructions, be as complete as detailed as you reasonably can. Submit requests early in the month.

## Bianca

- Bianca is a great platform for computationally intensive research on sensitive personal data. It can also be useful for:
    - national and international collaboration on sensitive personal data (without a high compute need)
    - other types of sensitive data
    - making sensitive data accessible (on Bianca)
        - [Swegen](https://snd.gu.se/en/catalogue/study/ext0285)
        - [SIMPLER](https://www.simpler4health.se/)
        - COPE (coming soon)
- Bianca is not intended for:
    - storing (inactive) data


## Bianca's design

- Bianca was designed
        - for sensitive data from large-scale molecular experiments
                - but has since grown into new domains
    - to make accidental data leaks difficult
    - to make correct data management as easy as possible
    - to emulate the HPC cluster environment that SNIC/NAISS users were familiar with
    - to provide a maximum amount of resources
    - and to satisfy regulations.

!!! note "Some definitions"

    - Node: A basic "computer", with processor, RAM memory, local disk, and network connection.
    - Core: A *part* of a processor (CPU), capable of executing a thread of execution.
    - Thread: A series of logical steps, executing a program.
    - Multithreading: A program that runs with many threads in parallel. Each thread can occupy one core.


### Bianca has no Internet

... but we have “solutions”

![Image](./img/biancaorganisation-01.png)

- Bianca is only accessible from within Sunet (i.e. from university networks).
- Use VPN outside Sunet.
    - [Link to VPN for UU](https://www.uu.se/en/staff/service-and-tools/tools-and-guides/connect-to-the-network-remotely/connect-using-the-universitys-vpn-service)
    - You can get VPN credentials from all Swedish universities. Search the web of your University.
- The whole Bianca cluster (blue) contains hundreds of virtual project clusters (green), each of which is isolated from each other and the Internet.
- Data can be transferred to or from a virtual project cluster through the ``wharf``, which is a special file area that is visible from the Internet.

### 10 minute reflection exercise

5 min: Consider your sensitive research data and write down the following:

- How you store and handle data outside of Bianca
    - Before analysis on Bianca
    - After analysis on Bianca
- How you treat data inside Bianca (``wharf``, ``/proj``, ``/proj/nobackup``, home dir (``$HOME``), etc)
- How you handle data transfers to/from Bianca

5 min: Go through your list and reflect on which steps are the weakest in terms of information security


### Common Questions

**What should I do if I have both sensitive and non-sensitive data?**

- It may be convenient to have a separate project on Rackham. Scripts and pipelines can then be built on Rackham and moved to Bianca.
- Having non-sensitive data on Bianca is okay, if maintaining two separate projects is impractical.

**One project or many? When should I apply for another project?**

- Because *every* member in a project should be assumed to have full access to all data, each different constellation of collaborators needs its own project.
- Because of the extra effort required to move data between projects, NAISS SENS projects can be extended and a continuation proposal is not necessary.
- Let data, ethical consent, and practicality rule.

**I need more core-hours!**

- Do you really?
        - First, use ``jobstats`` to determine whether you've been using your allocation efficiently.
        - Second, remember that you can still submit and run jobs after your allocation is out. Such "bonus" jobs run after normal-priority jobs. Typically, they will run in the evening, within a couple of days.
- If you know that you've been submitting efficient jobs and the wait time in the queue is an actual problem, then contact UPPMAX support and request more time. Motivate your request.

**I need more storage space!**

- Do you really?
        - First, make an inventory of the data in your project — what do you have, how much space does it take, and why is it there?
        - Second, delete data that you don't have an immediate plan to analyse.
        - Also convert all .sam files to .bam and compress all your .fastq files.
- If you've done all this and you still need space, contact UPPMAX support and request more space. Motivate your request by summarising your inventory. Include an estimate of your future needs.

!!! abstract "Keypoints"

    - Sensitive Personal data is data that could identify a person and that have implication
    - The workflow for a project is:
        - When doing your Data management plan,
            - do a DPIA,
            - apply for PUBA (if appropriate)
            - apply for project
    - DO science
    - Transfer resulted data
    - close project
