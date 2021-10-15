alias_file=$HOME/.bash/aliases.bash
newb_location="$PWD"

if [ -f "$alias_file" ]; then
  echo "Found 0xMF dotfile alias file."
  echo -n "Would you like to use the recommended 'newrm' command? [y]"
  read newrmchoice
  if [ $newrmchoice == "y" ]; then
    echo "alias rm=$newb_location/scripts/newrm.bash" >> $HOME/.bash/aliases.bash
    sleep 1
    echo "Updated rm command."
  fi
  echo -n "Would you like to use the cp and mv command with recommended flags? [y]"
  read cpflagchoice
  if [ $cpflagchoice == "y" ]; then
    echo "alias cp=cp -iv" >> $HOME/.bash/aliases.bash
    echo "alias mv=mv -iv" >> $HOME/.bash/aliases.bash
    sleep 1
    echo "Updated cp command."
  fi
else
  echo "0xMF dotfiles alias file not found, will append to $HOME/.bashrc"
  echo -n "Would you like to use the recommened 'newrm' command? [y]"
  read newrmchoice
  if [ $newrmchoice == "y" ]; then
    echo "alias rm=$newb_location/scripts/newrm.bash" >> $HOME/.bashrc
    sleep 1
    echo "Updated rm command."
  fi
  echo -n "Would you like to use the cp and mv command with recommended flags? [y]"
  read cpflagchoice
  if [ $cpflagchoice == "y" ]; then
    echo "alias cp=cp -iv" >> $HOME/.bashrc
    echo "alias mv=mv -iv" >> $HOME/.bashrc
    sleep 1
    echo "Updated cp command."
  fi
fi

echo "Installing recommended packages. Read more about these packages at https://github.com/5late/Newb-Config/#packages"

# General installation packages, some of the packages are what I use in my fork of 0xMF's dotfiles.
# It is recommended that you read #packages of the README before you install any packages from this script.

if [ "$(cat /etc/*-release | grep -v VERSION | grep -vE \"^#\" | grep ID)" == "ID=debian" ]; then
  xargs -rxa general_install.txt -- sudo apt install -y --
fi

echo "Finished installation of selected scripts/aliases. Good luck!"
