# Newb-Config

These are some basic beginner scripts that will make your life in the Linux Command Line a bit easier and more relaxed.

Some of the aliases here may make it a bit less scary to use the command line.

To jump to the installation instructions, [click here.](#Installation)


## Why use these scripts?

The contents of this repo contain scripts and aliases that may be useful to newbies in Linux. Commands such as ``rm`` can be intimidating due to their nature of being destructive and irreversible.

There are also some useful utilites such as sticky notes which can be helpful for productivity.

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

### Aliases

#### cp and mv aliases
- The ``cp`` alias automatically enables the ``-i`` and ``-v`` flags. The ``-i`` flag will prompt you for confirmation when copying a file that will overwrite a pre-existing file, and the ``-v`` flag will always provide verbose output.
- The ``mv`` alias also automatically enables the ``-i`` and ``-v`` flags that do the same thing as the ``cp`` command.

#### Compatability with [dotfiles](https://github.com/5late/dotfiles)
- I have made the scripts compatible with [my fork of 0xMF's dotfiles](https://github.com/5late/dotfiles) if you have them installed.

#### Included Package Installer
- The installer in the script installs basic packages that most users will want on their system.
- **Please read [#packages](#packages) to see what packages are being installed.**

## Installation

Run the following commands to install the scripts.

``git clone https://github.com/5late/Newb-Config``

``cd Newb-Config``

``bash install.sh``

The script will prompt you for a response for creating a new alias. It is recommended you answer with 'y'.

**INFO:** The script will *only* work with 'y'. Answers such as 'yes', 'ok', 'sure' will not be accepted.

After answering the prompts, the installation should be complete.

## Packages

**READ:** If you do not want any of the packages, open the corresponding text file, and delete the line with the package you do not want.

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
