history_lc="$(history | wc -l)"
newb_history=$HOME/.config/newb/history.txt
tmp_history=$HOME/.config/newb/tmp_hist.txt
tmp_command=$HOME/.config/newb/tmp_cmd.txt

if [ $# -eq 0 ] ; then
  history | cut -d' ' -f 4- > $newb_history
  tac $newb_history > $tmp_history
  mv $tmp_history $newb_history
  cat -n $newb_history | head -5
elif [ $# -gt 1 ] ; then
  if [ $1 == "r" ] && [ $2 -lt $history_lc ] ; then
    num=$(($2 + 1))
    echo "$(history | cut -d' ' -f 4- | tail -n $num | head -n 1)" > $tmp_command
    source $tmp_command
  fi
else
  if [ $1 -gt $history_lc ] ; then
    echo "History file does not go back that far."
  elif [ $1 -lt $history_lc ] ; then
    history | cut -d' ' -f 4- > $newb_history
    tac $newb_history > $tmp_history
    mv $tmp_history $newb_history
    cat -n $newb_history | head -$1
  fi
fi
