---
tags:
  - lesson
  - session
  - use
  - remote
  - desktop
  - environment
---

# Use the remote desktop environment

!!!- info "Learning outcomes"

    - Practice using the UPPMAX documentation
    - Can copy-paste text between local computer and the remote desktop
      (in both directions)
    - Can start a terminal
    - Can navigate the file system
    - Can find the wharf
    - Can start a visual text editor
    - (optional) Can find the name of the visual text editor
    - Can do basic things in the visual text editor: edit, save, close
    - (optional) Can do basic file management: create, copy, move and delete
      a file and folder
    - (optional) Can find the name of the file explorer

???- question "For teachers"

    Teaching goals are:

    - Learners have copy-pasted text between local computer
      and the remote desktop (in both directions)
    - Learners have used the file manager
    - Learners have started a terminal
    - Learners have started `gedit`
    - Learners have done basic things in gedit: edit a files, save, close
    - (optional) Learners have found out that the file explorer is called Thunar
    - (optional) Learners have found that the text editor is called gedit
    - (optional) Learners have done basic file management:
      create, copy, move and delete a file and folder

    Lesson plan:

    ```mermaid
    gantt
      title Using the remote desktop
      dateFormat X
      axisFormat %s
      section First hour
      Prior : prior, 0, 5s
      Present: present, after prior, 2s
      %% It took me 5 mins, here I do that time x2
      Challenge: crit, challenge, after present, 10s
      %% Here I use the same time it took me to give feedback
      Feedback: feedback, after challenge, 5s
    ```

    Prior questions:

    - Do you expect there to be much different behavior
      when using a remote desktop environment?

    Feedback questions:

    - None

## Why practice using a remote desktop?

After [logging in to the remote desktop](login_remote_desktop.md),
we can work with Bianca. Let's make sure we can do so :-)

Here we start to feel at ease using the remote desktop environment.
Most exercises (e.g. creating a file) will be intuitive to do.

The goal is to make sure you can indeed do all these 'simple' things,
as maybe you'll be too afraid to ask a colleague later.

## Exercises

???- question "Need a video?"

    The ['Intro to UPPMAX Day 1: Use the remote desktop environment'](https://youtu.be/XiPoHNs2SDQ)
    YouTube video shows
    the solution of these exercises.

It is assumed you are logged in to the remote desktop environment of Bianca.

For the extra exercises: no need to read the documentation here,
these are mostly finding out where to click.

### Exercise 1: copy-paste text

Go to the UPPMAX documentation at
[https://docs.uppmax.uu.se](https://docs.uppmax.uu.se),
then answer these questions:

- Find the page where it is documented to log in to
  Bianca's remote desktop via a webbrowser.

???- question "Answer"

    The UPPMAX documentation page
    ['Log in to the Bianca remote desktop environment website'](http://docs.uppmax.uu.se/getting_started/login_bianca_remote_desktop_website/).

- On that page, find where to find information on how to use the
  remote desktop

???- question "Answer"

    The link can be found at the 'Usage' heading,
    which takes you to [ThinLinc](https://docs.uppmax.uu.se/software/thinlinc/),
    the program that is the workhorse behind the website

- Copy-paste text from local computer to your remote desktop

???- question "Answer"

    Select some text on your local computer and press `CTRL + C` to copy
    it to your loal clipboard.

    Then, click on the menu bar on the left side of the window and click on the
    clipboard icon. Press `CTRL + V` to paste the text from your local
    clipboard to the remote desktop's clipboard

    ![Copy the text to the ThinLinc clipboard](./img/copy_to_clipboard.png)

    Then, in the remote desktop environment, press `CTRL + V` to paste
    the text from the remote desktop's clipboard to a text editor

    ![Do a regular paste in a text editor](./img/copied_to_text_editor.png)

- Copy-paste text from your remote desktop to your local computer

    In the remote desktop environment, press `CTRL + C` to copy
    the selected text to the remote desktop's clipboard.

    Then, click on the menu bar on the left side of the window and click on the
    clipboard icon. Copy the text in the remote desktop's clipboard using
    `CTRL + C` to your local computer's clipboard.

    Then, on your local computer, press `CTRL + V` to paste
    the text from your clipboard to a text editor

### Exercise 2: starting a terminal

- Start a terminal

???- question "Answer"

    At the bottom bar of the screen, click the icon for 'Terminal emulator':

    ![At the bottom bar of the screen, click the icon for 'Terminal emulator'](./img/start_terminal.png)

    You now have started a terminal:

    ![You now have started a terminal](./img/terminal.png)

- Close the terminal. There are multiple ways!

???- question "Answer"

    These are some of the more conventional ways to close a terminal:

    - Click on the `x` at the top-right of the terminal.
      When asked to really do it, say 'Yes'
    - Type `exit`
    - Many more: any solution that worked is fine

### Exercise 3: file navigation

- Start a program to navigate your files

???- question "Answer"

    ![The Bianca remote desktop environment](./img/bianca_remote_desktop.png)

    At the bar at the bottom of the screen, click on the rightmost folder icon
    to open the file explorer. You will be asked in which folder to open
    it (giving away the answer to the next question). Pick any.

- When you start that program, in which directory are you?

???- question "Answer"

    ![The Bianca remote desktop environment with the file explorer open](./img/bianca_remote_desktop_file_explorer.png)

    When you started the file explorer, you already had to pick a folder,
    giving away the answer to this question.

    In the file explorer, you can read the directory in the top bar.
    For the image above, the directory is called `/home/richel`.

- What is the full path to your home folder (whatever a 'home folder' is)?

???- question "Answer"

    ![The Bianca remote desktop environment with the file explorer open](./img/bianca_remote_desktop_file_explorer.png)

    When you started the file explorer, pick the top option 'Open folder'
    to open up your home folder.

    It's full path is `/home/[your UPPMAX username]`, where `[your UPPMAX username]`
    is your UPPMAX username.
    For the image above, the username was `richel` and hence the home directory
    is called `/home/richel`.

Your project folder is an important folder:
it is the folder where you run your project in.
It can be found at `/proj/[project_code]`,
where `[project_code]` is the project code.

- Navigate to the project folder of this course

???- question "Don't know the project code?"

    In our case, the project code is `sens2025560`,
    hence the project folder is `/proj/sens2025560`.

The `wharf` is an important folder: it is the only folder where files
can be transferred to/from.

- Navigate to the wharf folder of the project of this course

???- question "Cannot find it?"

    Go to [the UPPMAX documentation about the wharf folder](https://docs.uppmax.uu.se/cluster_guides/wharf/)

???- question "Still cannot find it?"

    It is at `/proj/nobackup/[project_id]/wharf/[user_name]/[user_name]-[project_id]`,
    hence, `/proj/nobackup/sens2025560/wharf/[user_name]/[user_name]-sens2025560`,
    or, for a user with username `sven`, at
    `/proj/nobackup/sens2025560/wharf/sven/sven-sens2025560`

(optional) To be able to search the web for questions on this file explorer,
its name will be useful to know:

- (optional) What is the name of the file explorer?

???- question "Answer"

    In the file explorer, click on `Help | About`:

    ![Thunar, click on `Help | About`](./img/thunar_help_about.png)

    It shows the name of the file explorer:

    ![Thunar's about screen](./img/thunar_about.png)

    The file navigator is called Thunar.

### Exercise 4: starting a text editor

- Create a file called `my_file.txt` (the `.txt` at the end is important),
  if not already present
- Edit a file by starting a visual text editor from the file explorer.
  There are many ways!

???- question "Answer"

    Here there are multiple ways:

    - Double-click the file. Because the file ends with `.txt` it will
      open a visual text editor

    ![Open file with a text editor](./img/open_file_with_text_editor.png)

    - Do a right-mouse button click on the file
      and select 'Open with text editor'

    It will look similar to this:

    ![A file opened with a text editor](./img/opened_file.png)

(Optional) To be able to search the web for questions on this graphical text editor,
its name will be useful to know:

- (optional) What is the name of the graphical text editor?

???- question "Answer"

    The visual text editor is called 'gedit'.

     You can see its name in the menu bar at the top:

    ![A file opened with gedit](./img/opened_file.png)

    You can also click on
    [the hamburger button](https://en.wikipedia.org/wiki/Hamburger_button)
    and click 'Help':

    ![The gedit hamburger menu](./img/gedit_help_about.png)

    This will show you the gedit about screen:

    ![The gedit about screen](./img/gedit_about.png)

- Save the file. There are multiple ways!

???- question "Answer"

    There are multiple ways, these are among the most conventional:

    - Press `CTRL + S`
    - Click on the 'Save' button at the top menu bar of gedit

    ![There is a 'Save' button at the top menu bar of gedit](./img/opened_file.png)

- Close the graphical text editor. There are multiple ways!

???- question "Answer"

    These are some of the more conventional ways to close the text
    editor:

    - Click on the `x` at the top-right of the terminal
    - In the hamburger menu, click 'Quit'

    ![The gedit hamburger menu](./img/gedit_hamburger_menu.png)


### (optional) Exercise 5: file management

In the file manager:

- create a file

???- question "Answer"

    In the file manager, click on the white space next/under the files with
    the right mouse button. In this pop-up menu, click 'Create a new file':

    ![Popup menu to create a new file](./img/create_a_new_file.png)

    In the following dialog, give it any filename:

    ![Give the file a name](./img/give_file_a_filename.png)

    Now the file is created:

    ![The created file is shown](./img/file_created.png)

- copy a file
- move a file
- delete a file
- create a folder
- copy a folder
- move a folder
- delete a folder
