# Newb-Config

These are some basic beginner scripts that will make your life in the Linux Command Line a bit easier and more relaxed.

Some of the aliases here may make it a bit less scary to use the command line.

To jump to the installation instructions, [click here.](#Installation)


## Why use these scripts?

The contents of this repo contain scripts and aliases that may be useful to newbies in Linux. Commands such as ``rm`` can be intimidating due to their nature of being destructive and irreversible.

## Manual

- The [``newrm`` script](./scripts/newrm.bash) replaces the traditional ``rm`` command with a script that automatically backs up all deleted items to a hidden directory in the home folder - ``$HOME/.deleted-files/``
  - To force a delete without backing up the file(s), use the regular ``rm`` command with the ``-f`` (force) flag. Ex: ``rm -f example.txt``
- The ``cp`` alias automatically enables the ``-i`` and ``-v`` flags. The ``-i`` flag will prompt you for confirmation when copying a file that will overwrite a pre-existing file, and the ``-v`` flag will always provide verbose output.
- The ``mv`` alias also automatically enables the ``-i`` and ``-v`` flags that do the same thing as the ``cp`` command.
- I have made the scripts compatible with [my fork of 0xMF's dotfiles](https://github.com/5late/dotfiles) if you have them installed.

## Installation

Run the following commands to install the scripts.

``git clone https://github.com/5late/Newb-Config``

``cd Newb-Config``

``bash install.sh``

The script will prompt you for a response for creating a new alias. It is recommended you answer with 'y'.

**INFO:** The script will *only* work with 'y'. Answers such as 'yes', 'ok', 'sure' will not be accepted.

After answering the prompts, the installation should be complete.

## Packages

#### General Installation

- Neofetch
  - Cool ASCII Art
  - Syncs with my fork of [dotfiles](https://github.com/5late/dotfiles) for log-in art

- Linux Logo
  - Cool ASCII Art (again)
  - Overrides Neofetch sync with my fork of [dotfiles](https://github.com/5late/dotfiles) for log-in art

- Rsync
  - Very powerful copy tool

- Python & Pip
  - Comes pre-installed on most systems
  - Base dependency for many other programs

- htop
  - System resource monitor 

- fakeroot
  - Required for installing many packages, usually ships default with most distros

#### Sysadmin Installation

- vnstat
  - Powerful network traffic reporter

- Apache2
  - http server, similar to nginx

- nmap
  - IP Port scanner

- dig/nslookup
  - Name server lookup/DNS checker

#### Networking Installation

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
