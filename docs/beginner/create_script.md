---
tags:
  - lesson
  - session
---

# Create an executable script

!!! info "Objectives"

    - Create an executable bash script

???- info "Notes for teachers"

    Teaching goals:

    - The learners demonstrate they can create an executable script

    Schedule:

    ```mermaid
    gantt
      title Lesson plan Command line
      dateFormat X
      axisFormat %s
      Prior knowledge: prior, 0, 5s
      Theory: theory, after prior, 5s
      Exercises: crit, exercise, after theory, 25s
      Feedback: feedback, after exercise, 10s
    ```

    Prior:

    - What is a script?
    - What is a scripting language?
    - What is an executable script?
    - Why use executable scripts?

    Feedback:

    - What is a script?
    - When would you use an executable script?

## Why use scripts?

You absolutely need a script to let your calculations be run on Bianca.

Besides that,
instead of typing commands in the terminal all the time,
you can put these in a file,
with the goal of automatic and/or sharing your work.

## Procedure

Creating an executable script has two steps:

- Create a script
- Allow the script to execute

Both steps are typically done on Bianca, in any folder.

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

Use [chmod](https://en.wikipedia.org/wiki/Chmod) to make the file executable:

```bash
chmod +x do_it.sh
```

- `+x` can be read as: 'add the right to execute'

!!! info "Create read-only files"
    If you want to protect your data from being modified accidentally,
    `chmod` can create read-only files,
    by removing the writing rights using `chmod -w`.

## Exercises

### Exercise 1: create an executable script

- On Bianca, create a file called `do_it.sh` using `nano`

???- question "Answer"

    Use `nano` to create it:

    ```bash
    nano do_it.sh
    ```

    Then do `CTRL + O` to save, `CTRL + X` to exit

- Edit the file `do_it.sh` to have the content below:

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

- Make the script executable

???- question "Answer"

    Do:

    ```bash
    chmod +x ./do_it.sh
    ```

- Run the script

???- question "Answer"

    Run the script:

    ```bash
    ./do_it.sh
    ```

    Or, alternatively:

    ```bash
    bash do_it.sh
    ```
