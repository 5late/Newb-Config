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
  echo -n "Would you like to use the cp command with recommended flags? [y]"
  read cpflagchoice
  if [ $cpflagchoice == "y" ]; then
    echo "alias cp=cp -iv" >> $HOME/.bash/aliases.bash
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
  echo -n "Would you like to use the cp command with recommended flags? [y]"
  read cpflagchoice
  if [ $cpflagchoice == "y" ]; then
    echo "alias cp=cp -iv" >> $HOME/.bashrc
    sleep 1
    echo "Updated cp command."
  fi
fi

echo "Finished installation of selected scripts/aliases. Good luck!"
