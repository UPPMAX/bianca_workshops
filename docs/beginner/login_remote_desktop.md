---
tags:
  - lesson
  - session
---

# Log in to the Bianca remote desktop environment

![The Bianca remote desktop environment](./img/bianca_remote_desktop_463_x_262.png)

> The Bianca remote desktop environment

!!! info "Learning outcomes"

    - Use the UPPMAX documentation
    - Observe the most common problems when accessing Bianca
    - Log in into Bianca's remote desktop environment using a website

???- info "Notes for teachers"

    Teaching goals:

    - The learners have used the UPPMAX documentation
    - The learners have observed the most common problems when accessing Bianca
    - The learners have logged in into Bianca's remote desktop environment using a website

    Schedule:

    ```mermaid
    gantt
      title Lesson plan Introduction and Logging in
      dateFormat X
      axisFormat %s
      section Introduction
      Prior knowledge: prior_1, 0, 5s
      Theory : theory_1, after prior_1, 5s
      section Logging In
      Prior knowledge: prior_2, after theory_1, 5s
      Theory: theory, after prior_2, 5s
      Exercises: crit, exercise, after theory, 30s
      Feedback: feedback, after exercise, 10s
    ```

    Prior:

    - What is a desktop environment?

    Feedback:

    - Your colleague visits [https://bianca.uppmax.uu.se/](https://bianca.uppmax.uu.se/)
      and nothing appears in his/her browser. What can be wrong?
    - What is a desktop environment?

## Why login to a remote desktop environment?

There are multiple ways to log in to Bianca, each having its own features.
These are the two we teach in this course:

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Way                                                  |Location    |Setup     |Environment|User experience|Same environment everywhere?|Other
-----------------------------------------------------|------------|----------|-----------|---------------|----------------------------|--------------------------
Using the remote desktop website                     |Within SUNET|None      |Desktop    |Clunky         |No, but similar             |Limited amount of licenses
Using the console environment                        |Within SUNET|SSH client|Console    |Powerful       |Identical                   |.

<!-- markdownlint-enable MD013 -->

First, we focus on the environment that most of us are familiar with:
a (remote) desktop environment.

## Exercises

???- question "Prefer a video?"

    [This 17 minutes long YouTube video](https://youtu.be/74f9AyKkOjg)
    shows how to do these exercises, so you can check your answers.

    A goal of these exercises is to practice to use the UPPMAX documentation.
    Such active learning is more effective than watching a video passively.
    Please try to do the exercises first!

    Specialized videos:

    - You can see [a YouTube video here](https://youtu.be/UpNI5OUlIo8)

### Exercise 1: Find the documentation

Search the UPPMAX documentation at
[https://docs.uppmax.uu.se/](https://docs.uppmax.uu.se/)
for how to log in to the Bianca remote desktop environment website.

???- info "Answer"

    In the search box, type 'Bianca log in remote desktop website' or something
    similar. This will take you to
    [https://docs.uppmax.uu.se/getting_started/login_bianca_remote_desktop_website/](https://docs.uppmax.uu.se/getting_started/login_bianca_remote_desktop_website/)

### Exercise 2: A user sees nothing

![The Bianca website does nothing](./img/login_uppmax_bianca_website_outside_sunet_browser_short.png)

> A colleague visiting [https://bianca.uppmax.uu.se/](https://bianca.uppmax.uu.se/) and sees nothing...

Your colleague visits [https://bianca.uppmax.uu.se/](https://bianca.uppmax.uu.se/)
and sees nothing appear on the website (see also image above).
What is likely the problem?

???- question "Answer"

    He/she is not inside of SUNET.

    Show him/her the section above on how to get into SUNET.

### Exercise 3: Log in to the Bianca remote desktop

Log in to the Bianca remote desktop.

???- question "Answer"

    It is in the UPPMAX documentation page
    ['Log in to the Bianca remote desktop environment website'](https://docs.uppmax.uu.se/getting_started/login_bianca_remote_desktop_website/).

    You can watch the YouTube video
    ['Log in to the Bianca remote desktop environment website'](https://youtu.be/UpNI5OUlIo8).

### Exercise 4: start a terminal in the Bianca remote desktop environment

Start a terminal in the Bianca remote desktop environment.

???- question "Answer"

    Click on the terminal icon at the bottom of the screen.

    ![The terminal icon at the bottom of the screen](./img/bianca_remote_desktop_terminal_icon.png)

    > The terminal icon at the bottom of the screen

