# Newb-Config

These are some basic beginner scripts that will make your life in the Linux Command Line a bit easier and more relaxed.

Some of the aliases and scripts can aid in making newer users more comfortabe with the command line.

|Table of Contents|
| --------------- |
| [Script Description](#scripts) |
| [Alias Description](#aliases) |
| [Installation](#installation) |
| [Updating](#updating) |
| [Packages](#packages) |


## Why use these scripts?

The contents of this repo contain scripts and aliases that may be useful to newbies in Linux.

There are also some useful utilites such as sticky notes and ``past`` which can be helpful for productivity.

## Manual

### Scripts

#### rm command
- The traditional ``rm`` command is replaced with an alias which points to the [``logrm`` script.](./scripts/logrm.sh) The ``logrm`` script logs all deletions to a hidden file in the users home directory - ``.removelog``.
  - The ``logrm`` file then calls upon the ``newrm`` script described below, to perform the actual deletion of the selected file(s).
  - To skip logging, use the ``-s`` flag.
- The [``newrm`` script](./scripts/newrm.sh) replaces the traditional ``rm`` command with a script that automatically backs up all deleted items to a hidden directory in the home folder - ``$HOME/.deleted-files/``
  - To force a delete without backing up the file(s), use the regular ``rm`` command with the ``-f`` (force) flag. Ex: ``rm -f example.txt``

#### stickynote scripts
- Add a short note with ``addnote NOTE HERE``
  - To add a longer note, simply run ``addnote`` alone. The terminal will print a empty line for you to begin typing on. Once you are done, you can exit with ``^D``.
- To see your notes, you can just run ``check``.
  - To search for a specific note, you can run ``check SEARCH TERM HERE``, the entire line containing the term will be returned.
  - To remove a specific note, run ``check rm REMOVE TERM HERE``, and all lines containing that term will be removed.

#### logging scripts
- Logs each time you log into/log out of your machine.
- Logs are saved to ``$HOME/.loginlog``
- Logs are completely silent

#### showlast script & past alias
- To see your past x shell commands, use ``past x``, where x is the number of past commands to show.
  - x cannot be bigger than the ``history`` command line count
- To run a past command, use ``past r x``, where x is the number beside the command (use ``past`` to see numbers)

### Aliases

#### cp and mv aliases
- The ``cp`` alias automatically enables the ``-i`` and ``-v`` flags. The ``-i`` flag will prompt you for confirmation when copying a file that will overwrite a pre-existing file, and the ``-v`` flag will always provide verbose output.
- The ``mv`` alias also automatically enables the ``-i`` and ``-v`` flags that do the same thing as the ``cp`` command.

#### Compatability with [dotfiles](https://github.com/5late/dotfiles)
- I have made the scripts compatible with [my fork of 0xMF's dotfiles](https://github.com/5late/dotfiles) if you have them installed.

#### Included Package Installer
- The installer in the script installs basic packages that most users will want on their system.
- **Please read [#packages](#packages) to see what packages are being installed.**

#### dotupdate
- If you have my fork of [dotfiles](https://github.com/5late/dotfiles), you can run ``dotupdate`` to automatically update them to the latest bleeding-edge changes

## Installation

There are two ways to install the scripts. The recommended way is to clone the repo and use [#repo-install](#repo-install). If you do not want to clone the repo, use [#repoless-install.](#repoless-install)

### Repo-Install

Run the following commands to install the scripts.

``git clone https://github.com/5late/Newb-Config``

``cd Newb-Config``

``chmod a+x install.sh``

``./install.sh``

### Repoless-Install

Run the following commands to get the files without cloning the repo.

``wget https://me.slatedev.xyz/projects/newbconfig/install.sh``

``chmod a+x install.sh``

``./install.sh``

You can remove the original ``install.sh`` script if you'd like.

The installation script will prompt you for responses as it installs and copies config files. The script is made to be as modular as possible, with each part being able to be installed without another.

**INFO:** The script will *only* work with 'y'. Answers such as 'yes', 'ok', 'sure' will not be accepted.

After answering the prompts, the installation should be complete.

## Updating

### Repoless (default)

Updating Newb-Config to the newest changes on GitHub is very simple. When installed, Newb-Config automatically copies scripts and creates an alias named ``ncupdate``.

Running ``ncupdate`` from anywhere in the system will automatically update Newb-Config by creating a temporary directory (``tmp-nc``), and downloading files into the directory.

The script then copies all of the new scripts to the config directory located in the users home, and deletes the temporary directory.

This process is known as REPOLESS mode, and is the recommended way of updating Newb-Config.

### Repo

To update Newb-Config using REPO mode, you will be required to change directory into either ``Newb-Config`` or ``Newb-Config/bin``.

Once you are in the directory, directly run the executable script with ``bin/update`` or ``./update``.

The script will prompt you to choose REPOLESS or REPO mode. To use REPO mode, enter ``r``. (You can skip this step by running the command with the argument ``r`` - ``bin/install r``.)

The script will ``git pull`` any new changes, and copy all files to the config directory in the users home.

This method is useful to keep the repository up to date, but it can only be run from the ``Newb-Config`` or ``Newb-Config/bin`` directories.


## Packages

**READ:** If you do not want any specific one of the packages, open the corresponding text file, and delete the line with the package you do not want.

#### General Installation

- Neofetch
  - Cool ASCII Art
  - Syncs with my fork of [dotfiles](https://github.com/5late/dotfiles) for log-in art

- Linux Logo
  - Cool ASCII Art (again)
  - Overrides Neofetch sync with my fork of [dotfiles](https://github.com/5late/dotfiles) for log-in art

- figlet
  - Text-to-Large-Letters formatter
  - Works alongside the neofetch/linux logo ascii art for my fork of [dotfiles](https://github.com/5late/dotfiles) for log-in art

- Rsync
  - Very powerful copy tool

- Python & Pip
  - Comes pre-installed on most systems
  - Base dependency for many other programs

- htop
  - System resource monitor 

- fakeroot
  - Required for installing many packages, usually ships default with most distros

- locate
  - locate is a fast and easy to use tool to find any file in the filesystem
  - locate also install updatedb, which updates the filesystems database for new files
  - updatedb should run a daily cron job to update for new files


#### Sysadmin Installation

All of the general installation, plus:

- vnstat
  - Powerful network traffic reporter

- Apache2
  - http server, similar to nginx

- nmap
  - IP Port scanner

- dig/nslookup
  - Name server lookup/DNS checker

#### Networking Installation

All of the general and sysadmin installation, plus:

- arp
  - Manipulate the ARP cache

- wireshark
  - Powerful GUI for reading TCP dump files (``.pcap``)

- tcpdump
  - Network packet sniffer

- nping
  - Ping a specifc port, using either ``tcp`` or ``udp``

- net-tools
  - Plenty of networking tools

- tcpflow
  - Packet sniffer/reader

- telnet
  - Insecure ssh text connection

- airemon-ng/aireplay-ng
  - Very powerful packet generator
