# Lab 1
## Table of Content
- [Overview](#overview)
- [Introduction to Linux](#introduction-to-linux)
   * [What is Linux?](#what-is-linux)
   * [Why Linux?](#why-linux)
   * [How to use Linux?](#how-to-use-linux)
   * [Command Line Interface](#command-line-interface)
   * [Directory Structure](#directory-structure)
   * [Command Structure](#command-structure)
   * [Common/useful commands](#commonuseful-commands)
      + [pwd](#pwd)
      + [ls](#ls)
      + [mkdir ](#mkdir)
      + [cd](#cd)
      + [touch](#touch)
      + [mv](#mv)
      + [cp](#cp)
      + [rm](#rm)
      - [echo](#echo)
      + [cat](#cat)
   * [Text Editing](#text-editing)
- [Git](#git)
   * [What is Git?](#what-is-git)
   * [What is version control?](#what-is-version-control)
   * [How does Git work?](#how-does-git-work)
   * [Cloning setup](#cloning-setup)
   * [Endpoint setup](#endpoint-setup)
   * [Before every lab](#before-every-lab)
- [The actual assignment](#the-actual-assignment)
   * [Part 1. Linux Commands](#part-1-linux-commands)
   * [Part 2. Git](#part-2-git)
- [Turn-ins](#turn-ins)
- [Appendix](#appendix)
   * [More on Git](#more-on-git)
   * [Working remotely](#working-remotely)
      + [Option 1: FastX (All OS) (REQUIRES VPN unless on school network)](#option-1-fastx-all-os-requires-vpn-unless-on-school-network)
      + [Option 2: SSH (All OS except for ChromeOS)](#option-2-ssh-all-os-except-for-chromeos)
      + [Option 2.5: SSH with X-forwarding (All OS except for ChromeOS) ](#option-25-ssh-with-x-forwarding-all-os-except-for-chromeos)


## Overview
- The purpose of this lab is to introduce you to the computing resources we will be using in not only ECE 120 but the entirety of your ECE career
- The lab consists of two major sections: basic linux commands and git
- It is very important that you read and understand all concepts in this and future labs
    * It is inefficient for both the students and the staff to answer questions that are explicitly mentioned in the lab

## Introduction to Linux
### What is Linux?
- Linux is an operating system[^1], just like Windows and macOS.
    * An operating system, or OS, is the lowest level software running on a computer. It manages the computer's resources, controls peripherals, and executes applications. 

### Why Linux?
- Linux is considered to be the industry standard for the vast majority of the work you are going to be doing in your career
- The Linux computers at UIUC are managed by EWS Links to an external site 
    * When you are logged in to an EWS Linux terminal, it does not matter if you are sitting at a particular computer or connecting remotely; all of your personal files will remain the same

### How to use Linux?
- You will need to login to EWS Linux machines either physically, or [remotely](#working-remotely) before you move forward with the following sections. We recommend using FastX if you are connecting remotely to the EWS machines.

### Command Line Interface
- Knowing how to use the CLI is very important
- Instead of telling the system what to do by clicking on icons, you give it text commands by typing them on the keyboard, and the computer responds in the same way with a textual response
- To open a command line terminal window, find "Applications" on the menu bar, and click on `System Tools` -> `Terminal`
- A similar prompt will appear as follows: `[netid@linux3 directory]$`
    * The most important part of this prompt is the `directory`, which will tell you what your current working directory is
    * You may see `~` when you open the terminal, `~` refers to your home, shorthand for `/home/netid`
- At this point, you should be logged into EWS with access to the terminal

### Directory Structure
- We can refer to a file[^2] by its "path"
- Like any path we need a starting point and an ending point
- The ending point is pretty obvious as it is just the file we want to refer to
- The starting point can be one of two places: 1. Your current working directory or 2. The root
    * Think of the directory structure as a big tree, the root refers to the places where all directories either directly or indirectly stem from
    * Your current working directory can be referred to as `.` and the root is `/`
    * You may also use `~` mentioned above to refer to your home, which will be the place of all your work in ECE 120
- Examples:
    * The download folder
        * `/home/netid/Downloads`
    * A file we downloaded
        * `~/Downloads/downloaded_file`
        * Notice how we used `~` to replace the long text (home)
- To get a visualization of the file structure, try running `tree ~ -L 3` in the terminal
    * `-L` specifies the depth, i.e. how many layers to go into

- Examples with relative paths
    * If our curent working directory is very deep like `~/folder1/folder2/folder3/folder4/folder5/folder6`, and we want to access something that is nearby, it would be a big hassle to type out everything again
    * We want to access `file1` in `folder6`
        * Instead of `~/folder1/folder2/folder3/folder4/folder5/folder6/file1`, we can simply do `./file1`
    * We want to access `file2` in `folder5`
        * We can do `../file2`
        * Notice the `..` refers to the parent of the current working directory
        * You can also chain `..` together, i.e. `../../file3`

### Command Structure
- Commands generally look like `command [flags] [arguments]`
- Flags are modifiers for the command that will behave differently
- Arguments are what the command is operating on, some flags may require its own argument

### Common/useful commands
Make sure you have a terminal pulled up for the "Try it out" part
#### pwd
- Function: **p**rint **w**orking **d**irectory
- Important flags:
    * None
- Arguments:
    * None
- Try it out:
    * `pwd`
        * You should see something like `/home/your_netid` printed out
        * If you see something else, open a new terminal and use that

#### ls
- Function: **l**i**s**ts files at a given directory
- Important flags:
    * `-l` displays files as a vertical list
    * `-a` displays all files, including hidden files, current directory, and parent directory
- Argument:
    * Path to the directory we want to `ls`
    * If no argument was given, path is assumed to be current working directory
- Try it out:
    * `ls -la ~`
        * This will display all the files in your home `~` directory

#### mkdir 
- Function: **m**a**k**e (create) **dir**ectory
- Important flags:
    * `-p` creates parent directory if doesn't exist
- Arguments:
    * Path to directory we want to create
- Try it out:
    * `mkdir ./120_try_it_out`
        * This will create a directory called `120_try_it_out` in `.` (which is also `~`)

#### cd
- Function: **c**hange **d**irectory
- Important flags:
    * None
- Arguments:
    * Path to the directory we want to `cd` into
- Try it out:
    * `cd ./120_try_it_out`
        * This will change your working directory to `./120_try_it_out`, the one we just created

`tree` output
```
.
```

#### touch
- Function: creates a file
- Important flags:
    * None
- Arguments:
    * Path to the file we want to `touch`
- Try it out:
    * `touch cool_file`
        * This will create a file named `cool_file`

`tree` output
```
.
└── cool_file
```

#### mv
- Function: **m**o**v**e (cut)
- Important flags:
    * None
- Arguments:
    * Source file/directory
    * Destination file/directory
- Try it out:
    * Before trying this command, let's create two more directories `dir_1` and `dir_2` in `~/120_try_it_out`
    * `mv ./cool_file ./dir_1`
        * This will move the file `cool_file` into `dir_1`, retaining its original name (since we did not specify one)

`tree` output
```
.
├── dir_1
│    └── cool_file
└── dir_2
```

#### cp
- Function: **c**o**p**y
- Important flags:
    * `-r` recursively, for directory and all its children
- Arguments:
    * Source file/directory
    * Destination file/directory
- Try it out:
    * `cp ./dir_1/cool_file ./dir_2/uncool_file`
        * This will copy the file `./dir_1/cool_file` into `./dir_2` with the new name `uncool_file`
`tree` output
```
.
├── dir_1
│    └── cool_file
└── dir_2
     └── uncool_file
```

#### rm
- Function: **r**e**m**ove
- Important flags:
    * `-r` recursively, for directory and all its children
- Arguments:
    * Path to location we want to remove
- Try it out:
    * `rm ./dir_2/uncool_file` (1)
    * `rm -r ./dir_2` (2)

`tree` output (1)
```
.
├── dir_1
│    └── cool_file
└── dir_2
```
`tree` output (2)
```
.
└── dir_1
     └── cool_file
```

#### echo
- Function: Display text
- Important flags:
    * None
- Arguments:
    * Text to display
- Try it out:
    * `echo "Hello!"`
        * You should see the text "Hello!" being "echoed" back to you on the terminal
    * `echo "Goodbye!" > ./dir_1/cool_file`
        * Instead of printing the text on the terminal, we redirect it using `>` to overwrite it into the file `./dir_1/cool_file`
        * If you want to append instead of overwrite, use `>>`

#### cat
- Function: con**cat**enate (Prints out file content)
- Important flags:
    * None
- Arguments:
    * Path to file we want to print
- Try it out:
    * `cat ./dir_1/cool_file`
        * You should see "Goodbye!", the same string we just `echo` into the file

Just to clean things up, let's go back to the home folder and remove the `120_try_it_out` directory we made for these commands.

### Text Editing
There are plenty of CLI text editors, feel free to try them around and use the one you are comfortable with:  
- `nano`
- `vim`
- `emacs`

## Git
### What is Git?
Git is a version control system.  
Here is a [video](https://mediaspace.illinois.edu/media/t/1_yfmz12d7) that you should watch **AFTER** finishing the lab

### What is version control?
Version control is the management of changes to files. Have you ever made a change to a document that you later regretted? A revision control system allows you to keep track of the different versions of a document, so that you can later revert back to before you made that unwanted change. Revision control is especially useful in team projects where multiple people are making changes to a set of documents due to its ability to automatically handle separate changes to the same file.

### How does Git work?
Git maintains a central repository, one or more revisions of a directory and all its contents, on a server. You can get a copy of one version of that directory in a process called a checkout, which will take a specific version of your repository and copy it to your machine. To get access to the main branch of the repository, which is the main version of your code, you must first clone your repository (more on that later). You can make local changes to your copy of the directory, and then add the new version to the central repository in a process called a commit.

### Cloning setup
Here is a [video tutorial](https://mediaspace.illinois.edu/media/t/1_w5wq0eyv) for the steps below if you prefer that.
1. Change your working directory to be in `~/.ssh`, if the directory does not exist, create it (don't forget the `.` in front)
2. Generate the SSH key with `ssh-keygen -t rsa -b 4096 -C "your email"`
    * `-t rsa` specifies the type of the crytographic encryptor `rsa` in our case
    * `-b 4096` specifies the length of the key
    * `-C` appends comment to the ssh key
3. When it asks for the file in which to save the key, enter `github`
4. You may leave the passphrase blank by pressing enter only
5. When you check the `~/.ssh` directory, you should see two files we care about: `github` and `github.pub`
    * DO NOT share `github` with anyone, only `github.pub`
6. Create a config: `~/.ssh/config` with the following content:
   (Need help? watch the [video tutorial](https://mediaspace.illinois.edu/media/t/1_w5wq0eyv))
```
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github
    IdentitiesOnly Yes
```
7. Change the permission via `chmod 600 ~/.ssh/config` and `chmod 700 ~/.ssh/config`
8. Head to github.com, Navigate to your profile at the top right corner ->Setting->SSH and GPG Keys (under "Access" on the left column)
9. Add the new SSH key, name it something like EWS
10. Leave the key type as-is
11. Run `cat ~/.ssh/github.pub` and copy paste the printout into the box on github.com
    * The printout should start with `ssh-rsa` and end with your email, include these as well
12. After adding the key, you should see a `Configure SSO` option, click on that and authorize `illinois-cs-coursework`
13. Go back to your home `~`
14. Clone your repo via `git clone git@github.com:illinois-cs-coursework/sp24_ece120_netid.git ece120`
    * Remember to replace the `netid` with your own
    * If you did everything correctly, you should see no error and the locally cloned directory `~/ece120`

### Endpoint setup
1. Add the release endpoint to your repo by doing `git remote add release git@github.com:illinois-cs-coursework/sp24_ece120_.release.git`
    * Make sure to do this in your `ece120` folder you just cloned
2. Run the following command so we know who you are
    * `git config --global user.name "Your Name"`
    * `git config --global user.email "netid@illinois.edu"`

### Before every lab
1. `git fetch release` to fetch any update to the release repo
2. `git merge release/main -m "Merging release" --allow-unrelated-histories` to merge the update you just fetched

## The actual assignment
### Part 1. Linux Commands
Here is the initial state of the file from release:
```
lab1
    - baz.txt
    - foo.txt
    - garbage.txt
    - junk.txt
    - README.md
```
Here is what we want from you:
1. Remove the last line in `foo.txt`
2. Create a filed named `bar.txt` with the text `This is a file` inside
3. Create a directory called `stuff`
4. Move `baz.txt` inside `stuff`
5. Copy `junk.txt` inside `stuff`
6. Remove `garbage.txt`

### Part 2. Git
- When you are done with the instructions above, run `git status` to see what has been changed  
- Git realize these files has been changed but is ignoring them  
- Tell Git to track them by doing `git add [filename]` or simply `git add -A` to add all changed files
- Now that the files are tracked, we want to create a commit with `git commit -m "your message here"`
    * The message what be whatever but it is good practice to keep it relevant to your changes
- We have created a commit, now we need to upload it to the git server (github)
- Run `git push origin main`
    * `push` uploads the commit
    * `origin` refers to the repo you cloned from
    * `main` refers to the branch of the repo
- Now you should be to see the changes on github.com

## Turn-ins
- Your github repo state is your turn-in
- An autograder will be ran on the repo to check if your changes are correct

## Appendix
### More on Git
Git thinks of its data more like a series of snapshots of a miniature filesystem. With Git, every time you commit, or save the state of your project, Git basically takes a picture of what all your files look like at that moment and stores a reference to that snapshot. To be efficient, if files have not changed, Git doesn't store the file again, just a link to the previous identical file it has already stored. Git thinks about its data more like a stream of snapshots.

### Working remotely
#### Option 1: FastX (All OS) (REQUIRES VPN unless on school network)
[Connecting to EWS Linux with FastX](https://answers.uillinois.edu/illinois.engineering/page.php?id=81727)

#### Option 2: SSH (All OS except for ChromeOS)
- SSH stands for Secure Shell which does not give you access to Graphics User Interface, or GUI, refer to option 2.5 for GUI with SSH  
- `ssh [your netid]@linux.ews.illinois.edu` in your terminal

#### Option 2.5: SSH with X-forwarding (All OS except for ChromeOS) 
***Linux*** - `ssh -X [your netid]@linux.ews.illinois.edu`  
***Windows*** - You will need to install puTTy and XMing, and enable the X11 forwarding option in puTTY  
***macOS*** - You will need to install XQuartz  

[^1]: Technically it's a kernel, a part of an operating system, but that's beyond the scope of this course

[^2]: [Everything is a file](https://en.wikipedia.org/wiki/Everything_is_a_file)
