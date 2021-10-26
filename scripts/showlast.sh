history_lc="$(history | wc -l)" # get the line count of the history output
newb_history=$HOME/.config/newb/history.txt # history storage file
tmp_history=$HOME/.config/newb/tmp_hist.txt # temporary storage for flipped history
tmp_command=$HOME/.config/newb/tmp_cmd.txt # temporary storage for command to run

if [ $# -eq 0 ] ; then
  history | cut -d' ' -f 4- > $newb_history # echo to history file
  tac $newb_history > $tmp_history # flip the output backwards
  mv $tmp_history $newb_history # move file back
  cat -n $newb_history | head -5 # print first 5 lines
elif [ $# -gt 1 ] ; then
  if [ $1 == "r" ] && [ $2 -lt $history_lc ] ; then # run command option
    num=$(($2 + 1))
    echo "$(history | cut -d' ' -f 4- | tail -n $num | head -n 1)" > $tmp_command # put command in file
    source $tmp_command # source the file, running the command
  fi
else
  if [ $1 -gt $history_lc ] ; then # make sure the input is not bigger than the lc defined in line 1
    echo "History file does not go back that far."
  elif [ $1 -lt $history_lc ] ; then # else, just print the number of output lines
    history | cut -d' ' -f 4- > $newb_history # echo to history files
    tac $newb_history > $tmp_history # flip the files
    mv $tmp_history $newb_history # move the file back
    cat -n $newb_history | head -$1 # print the first x lines
  fi
fi
