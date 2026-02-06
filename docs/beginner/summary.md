# Summary

Learning outcomes of this course:

- I can log in to the Bianca remote desktop using the website
- :rocket: I can log in to the Bianca console environment using SSH
- I can navigate to the wharf folder using a graphical file manager
- I can manage my files and folders using a graphical file manager
- :rocket: I can navigate to the `wharf` folder using a terminal
- :rocket: I can manage my files and folders using a terminal
- I can create a Bash script
- I can use modules
- I can transfer files to/from Bianca using a graphical tool
- I can start an interactive session
- I can submit jobs to the scheduler
- I can start an IDE

The items with :rocket: are optional.

This course and its relation to the Bianca Intermediate course:

```mermaid
%% Direction is top->down
flowchart TD

    %% Give a white background, instead of a transparent one
    classDef node fill:#fff,color:#000,stroke:#000
    classDef focus_node fill:#fff,color:#000,stroke:#000,stroke-width:4px
    classDef basic_node fill:#fdd,color:#000,stroke:#f00
    classDef basic_extra_node fill:#ffd,color:#000,stroke:#ff0
    classDef intermediate_node fill:#dfd,color:#000,stroke:#0f0

    %% subgraph sub_basic_use[Basic use of Bianca]
      understand_login(Understand login, has 2FA):::basic_node
      can_login_to_remove_desktop(Can login to remote deskop):::basic_node
      can_login_to_console(Can login to console):::basic_extra_node
      can_navigate_filesystem_using_gui(Can navigate filesystem using GUI):::basic_node
      can_navigate_filesystem_using_cli(Can navigate filesystem using CLI):::basic_extra_node
      can_find_wharf(Can find the wharf):::basic_node
      can_use_command_line_1(Can use the command line 1):::basic_node
      can_use_modules(Can use modules):::basic_node
      can_use_interactive_node(Can use an interactive node):::basic_node
      can_manage_files_using_cli(Can manage files using CLI):::basic_extra_node
      can_schedule_jobs(Can schedule jobs):::basic_node
      can_create_bash_script_using_cli(Can create a bash script using CLI):::basic_node
      can_tranfer_files_using_gui(Can transfer files using GUI):::basic_node
    %% end
    %% style sub_basic_use fill:#fcc,color:#000,stroke:#fcc

    %% subgraph sub_intermediate_use[Intermediate use of Bianca]
      can_tranfer_files_using_rsync(Can transfer files using rsync):::intermediate_node
      can_use_command_line_2(Can use the command line 2):::intermediate_node
      can_use_custom_software(Can use custom software):::intermediate_node
      can_monitor_jobs(Can monitor jobs):::intermediate_node
      can_use_ide(Can use an IDE):::basic_node
    %% end
    %% style sub_intermediate_use fill:#ffc,color:#000,stroke:#ffc


    %% Basic
    understand_login --> can_login_to_remove_desktop
    can_login_to_remove_desktop --> can_login_to_console
    can_login_to_remove_desktop --> can_use_command_line_1
    can_login_to_remove_desktop --> can_navigate_filesystem_using_gui
    can_navigate_filesystem_using_gui --> can_find_wharf
    can_login_to_console --> can_navigate_filesystem_using_cli
    can_navigate_filesystem_using_cli --> can_find_wharf
    can_find_wharf --> can_tranfer_files_using_gui
    understand_login --> can_login_to_console
    can_login_to_console --> can_use_command_line_1
    can_use_command_line_1 --> can_use_modules
    can_use_command_line_1 --> can_use_interactive_node
    can_use_command_line_1 --> can_use_command_line_2
    can_use_command_line_1 --> can_create_bash_script_using_cli
    can_use_command_line_1 --> can_schedule_jobs
    can_navigate_filesystem_using_cli --> can_manage_files_using_cli
    can_use_modules --> can_schedule_jobs
    can_create_bash_script_using_cli --> can_schedule_jobs

    %% Basic -> Intermediate
    can_manage_files_using_cli --> can_tranfer_files_using_rsync
    can_find_wharf --> can_tranfer_files_using_rsync
    can_schedule_jobs --> can_monitor_jobs
    can_use_interactive_node --> can_use_ide
    can_use_modules --> can_use_ide

    %% Make sure Intermediate is below Basic,
    %% using invisible nodes
    can_schedule_jobs ~~~ can_use_command_line_2

    %% Intermediate
    can_use_command_line_1 --> can_tranfer_files_using_rsync
    can_use_command_line_2 --> can_use_custom_software
```

> Overview of the courses.
> Red nodes: Intro to Bianca.
> Yellow node: Intro to Bianca extra material.
> Green node: Intermediate Bianca.

Possible next steps:

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

I want to ...                   |Solution
--------------------------------|-------------------------------
work smarter with Bianca        |Attend [the 'Bianca Intermediate' course](https://uppmax.github.io/bianca_workshops/intermediate/intro/)
do my computational work smarter|Attend [the 'Programming Formalisms' course](https://uppmax.github.io/programming_formalisms/)
transfer files smarter          |Attend [the NAISS 'File Transfer' course](https://uppmax.github.io/naiss_file_transfer_course/)
work smarter on the command line|Attend [the NAISS 'Command line 101' course](https://nbisweden.github.io/SCoRe_user_doc/courses/)
find out what courses there are |See [the SCoRe overview of courses](https://nbisweden.github.io/SCoRe_user_doc/courses/)

<!-- markdownlint-enable MD013 -->
