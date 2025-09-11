---
tags:
  - lesson
  - session
---

# Login via a terminal

![The Bianca console environment](./img/bianca_console_461_x_202.png)

> The Bianca console environment

!!!- info "Learning outcomes"

    - Practice using the UPPMAX documentation
    - Understand what a console environment is
    - Understand what a terminal is
    - Understand what a prompt is
    - Understand that after login, one is on a login node
    - If needed: has installed an SSH client
        - Windows: MobaXTerm

???- question "For teachers"

    Teaching goals are:

    - Learners have practiced using the UPPMAX documentation
    - Learners understand what a console environment is
    - Learners understand what a terminal is
    - Learners understand what a prompt is
    - Learners understand that after login, one is on a login node
    - If needed, learners have installed an SSH client
        - Windows: MobaXTerm

    Lesson plan:

    ```mermaid
    gantt
      title Login via terminal
      dateFormat X
      axisFormat %s
      section First hour
      Prior : prior, 0, 5s
      Present: present, after prior, 2s
      %% It took me 7 mins, here I do that time x2
      Challenge: crit, challenge, after present, 14s
      %% Here I use the same time it took me to give feedback
      Feedback: feedback, after challenge, 7s
    ```

    Prior questions:

    - What is a console environment?
    - What is a terminal?
    - What is SSH?
    - What is an SSH client?

    Feedback:

    - What is an SSH client?

## Why login via a terminal?

It is useful to have multiple ways to login,
as these allow you to use different tools.

In general, a remote desktop is clumsy,
where a terminal is powerful.

## A terminal and SSH clients

A terminal is a text-only program that can do many things, for example,
starting a program.
An SSH client is a program that allows you to connect to another computer.
Some SSH clients can run from a terminal or vice versa.

## Exercises

???- question "Need a video?"

    The YouTube video
    ['Intro to UPPMAX Day 1: Login via a terminal'](https://youtu.be/FUNPZHEMC2s)
    shows the solution of these exercises

Here, we log in to Bianca's console environment via a terminal.

For Mac and Windows users it will be hardest to get it working.

### Exercise 1: a terminal

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Find the UPPMAX page on terminals

???- question "I cannot find it. Where is it?"

    You can find find it at <https://docs.uppmax.uu.se/software/terminal/>

- What is a prompt?

???- question "Answer"

    The prompt is the text at the start of the line you can type on.
    It indicates that the terminal is waiting for user input.

### Exercise 2: install an SSH client if needed

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Find the UPPMAX page on SSH clients

???- question "Answer"

    You can find find it at <https://docs.uppmax.uu.se/software/ssh_client/>

- Try starting a terminal and type `ssh` and then enter.
  If you do not get an error message, you are lucky to have an SSH client
  installed!

???- question "How does it look like when `ssh` works?"

    Your output will look similar to this:

    ```bash
    richel@richel-N141CU:~$ ssh
    usage: ssh [-46AaCfGgKkMNnqsTtVvXxYy] [-B bind_interface] [-b bind_address]
               [-c cipher_spec] [-D [bind_address:]port] [-E log_file]
               [-e escape_char] [-F configfile] [-I pkcs11] [-i identity_file]
               [-J destination] [-L address] [-l login_name] [-m mac_spec]
               [-O ctl_cmd] [-o option] [-P tag] [-p port] [-R address]
               [-S ctl_path] [-W host:port] [-w local_tun[:remote_tun]]
               destination [command [argument ...]]
           ssh [-Q query_option]
    ```

- If there is an error, install the recommended SSH client

### Exercise 3: login via SSH

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Find the page about how to login to Bianca via SSH and a password

???- question "I cannot find it. Where is it?"

    You can find find it at
    <https://docs.uppmax.uu.se/getting_started/login_bianca_console_password/>

- Log in to Bianca

???- question "How does that look like?"

    Your ouput will look similar to this:

    <!-- markdownlint-disable MD013 --><!-- Indeed, line lengths beyond 80 characters -->

    ```bash
    sven@richel-N141CU:~/GitHubs/uppmax_intro_day_1/docs/sessions$ ssh -X sven@Bianca.uppmax.uu.se
    sven@Bianca.uppmax.uu.se's password:
    Last login: Thu Aug  8 18:35:17 2024 from vpnpool189-229.anst.uu.se
     _   _ ____  ____  __  __    _    __  __
    | | | |  _ \|  _ \|  \/  |  / \   \ \/ /   | System:    Bianca1
    | | | | |_) | |_) | |\/| | / _ \   \  /    | User:      sven
    | |_| |  __/|  __/| |  | |/ ___ \  /  \    |
     \___/|_|   |_|   |_|  |_/_/   \_\/_/\_\   |

    ###############################################################################

            User Guides: https://docs.uppmax.uu.se/

            Write to support@uppmax.uu.se, if you have questions or comments.


    [sven@Bianca1 ~]$
    ```

    <!-- markdownlint-enable MD013 -->


Welcome on a login node!
