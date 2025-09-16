---
tags:
  - lesson
  - session
---

# Create an executable script

!!! info "Objectives"

    - Create a Bash script by copy-pasting
    - Run a Bash script

???- info "Notes for teachers"

    Teaching goals:

    - Learners can create a Bash script by copy-pasting
    - Learners can run a Bash script

    Prior:

    - What is a script?

    Feedback:

    - What is a script?
    - When would you use a script?

## Why use scripts?

You absolutely need a script to let your calculations be run on Bianca.

Besides that,
instead of typing commands in the terminal all the time,
you can put these in a file,
with the goal of automatic and/or sharing your work.

## Procedure

As an example, from a terminal on Bianca,
we create a script, called `do_it.sh`:

```bash
nano do_it.sh
```

!!! info "Why use a `.sh` file extension?"

    Using `.sh` as a file extension a social convention
    for how a Bash script is called,
    as (1) `sh` is short for 'shell',
    (2) Bash is short for 'Bourne Again Shell'.
    A 'shell' in this context is a program
    that allows working with an operating system.

As an example, copy-paste this content into the script:

```bash
#!/bin/bash
echo "Hello!"
```

!!! info "What does this program do?"

    The first line is called the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)),
    and indicates this is a Bash script.

    The second line displays the text between double quotes.

Save and close `nano`.

- Use `CTRL-O` to start saving your file, then edit the filename, then
  press enter
- Use `CTRL-X` to exit

You can run the script with:

```bash
bash do_it.sh
```


## Exercises

### Exercise 1: create a script

- On Bianca, create a file called `do_it.sh` using `nano`

???- question "Answer"

    Use `nano` to create it:

    ```bash
    nano do_it.sh
    ```

    Then do `CTRL + O` to save, `CTRL + X` to exit

- Use **copy-paste** to edit the file `do_it.sh` to have the content below.
  This script may be small, yours will likely not be, hence use a copy-paste

```bash
#!/bin/bash
echo "Hello!"
```

???- question "Answer"

    Use `nano` to edit it:

    ```bash
    nano do_it.sh
    ```

    Then do `CTRL + O` to save, `CTRL + X` to exit

- Run the script

???- question "Answer"

    Run the script:

    ```bash
    bash do_it.sh
    ```
