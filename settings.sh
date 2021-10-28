echo "Extra settings script"
echo
alias_file=$HOME/.bashrc
home_alias_file=$HOME/.bash/aliases.bash

if [ -f "$home_alias_file" ]; then
  echo "Found alias in ~/.bash"
  alias_file=$HOME/.bash/aliases.bash
fi

if [ $# -eq 0 ]; then
  echo "Please choose a script to edit settings."
  echo "Rerun this command using the name of the script you would like to edit."
  echo "There are settings available for:"
  echo
  echo "- check"
fi

if [ "$1" == "check" ]; then
  echo "Would you like the 5 most recent notes to show up on login?"
  read loginchoice
  if [ $loginchoice == "y" ]; then
    echo "cat $HOME/.remember | tail -5" >> $HOME/.bashrc
    echo
    sleep 1
    echo "Updated command."
  fi
fi

if [ "$1" == "aliases" ] && [ "$2" == "rm" ]; then
  echo "Which alias would you like to remove?"
  echo
  echo "cp"
  echo "mv"
  echo "rm"

  read aliasremove

  if [ $aliasremove == "cp" ]; then
    sed -i "/alias cp='cp -iv'/d" $alias_file
  elif [ $aliasremove == "mv" ]; then
    sed -i "/alias mv='mv -iv'/d" $alias_file
  fi
fi
