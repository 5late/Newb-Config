echo "Extra settings script"
echo

if [ $# -eq 0 ]; then
  echo "Please choose a script to edit settings."
fi

if [ $1 == "check" ]; then
  echo "Would you like the 5 most recent notes to show up on login?"
  read loginchoice
  if [ $loginchoice == "y" ]; then
    echo "cat $HOME/.remember | tail -5" >> $HOME/.bashrc
    echo
    sleep 1
    echo "Updated command."
  fi
fi
