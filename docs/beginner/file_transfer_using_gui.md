---
tags:
  - lesson
  - session
---

# File transfer using a graphical tool

![FileZilla connected to Bianca](./img/filezilla_login_to_bianca_236_x_266.png)

> FileZilla connected to Bianca

!!! info "Objectives"

    - [Transfer files to/from Bianca using FileZilla](https://github.com/UPPMAX/bianca_workshops/issues/35)

## Exercises

Read the UPPMAX page on
[file transfer using a graphical tool](https://docs.uppmax.uu.se/software/bianca_file_transfer_using_gui/),
then do these exercises.

???- question "1. Your colleague uses an SCP tool for secure file transfer. It does not work on Bianca. What is the problem?"

    The assumptions of your colleague are already wrong:
    SCP is considered an **outdated** secure (`outdated + secure = insecure`)
    file transfer protocol.

    Bianca does not support this outdated file transfer protocol.
    Instead, use a tool that allows the SFTP secure file transfer protocol.

???- question "2a. Exercise: upload a file to Bianca"

    This is described in the text above.

    There is also a YouTube video
    ['Transfer files to/from the Bianca UPPMAX HPC cluster using FileZilla'](https://youtu.be/DYPWawyK5UE).

???- question "2b. Locate that file on Bianca using the graphical file explorer"

    Its location is at `/proj/nobackup/[project_name]/wharf/[user_name]/[user_name]-[project_name]`,
    for example, at `/proj/nobackup/sens123456/wharf/sven/sven-sens123456`.

    Start the file explorer and navigate there.

    ![FileZilla file on Bianca](./img/filezilla_file_on_bianca.png)

???- question "2c. Locate that file on Bianca using the terminal"

    Its location is at `/proj/nobackup/[project_name]/wharf/[user_name]/[user_name]-[project_name]`,
    for example, at `/proj/nobackup/sens123456/wharf/sven/sven-sens123456`.

    Start a terminal and use `cd` to change to that directory, e.g.,
    from your home folder, run
    `cd /proj/nobackup/sens123456/wharf/sven/sven-sens123456`.

    In that folder, type `ls` to list the files present in that folder.

    ![FileZilla file on Bianca](./img/filezilla_file_on_bianca.png)
