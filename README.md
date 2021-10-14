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


## Installation

Run the following commands to install the scripts.

``git clone https://github.com/5late/Newb-Scripts``

``cd Newb-Scripts``

``bash install.sh``

The script will prompt you for a response for creating a new alias. It is recommended you answer with 'y'.

**INFO:** The script will *only* work with 'y'. Answers such as 'yes', 'ok', 'sure' will not be accepted.

After answering the prompts, the installation should be complete.
