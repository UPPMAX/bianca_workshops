---
tags:
  - lesson
  - session
---

# Starting an interactive node

![login_bianca_via_terminal_terminal](./img/login_bianca_via_terminal_terminal_462_x_202.png)

???- info "Note to teachers"

    We teach `interactive`
    (over [`salloc`](https://slurm.schedmd.com/salloc.html))
    as it is recommended by the UPPMAX system experts.

## Exercises

Read the UPPMAX documentation
['Starting an interactive session on Bianca'](https://uppmax.github.io/UPPMAX-documentation/cluster_guides/start_interactive_session_on_bianca),
then do these exercises.

???- question "Exercise: Start an interactive session"

    The goal of this exercise is to make sure you know how to start an interactive session.

???- question "Why not always use an interactive session?"

    Because it is an inefficient use of your core hours.

    An interactive session means that you use a calculation node with low
    efficiency: only irregularly you will use such a node to its full
    capacity.
    However, the number of core hours are registered as if the node is used
    at full capacity, as it is *reserved* to be used at that capacity.

???- question "How to find out if you are on a login or compute node"

    In the terminal, type `hostname`

    - the login node has `[project]-bianca`,
      where `[project]` is the name of the project, e.g. `sens2025560`
    - a compute node has `b[number]` in it,
      where `[number]` is the compute node number

