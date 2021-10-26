history_file="$HOME/.bash_history"
history_lc="$(wc -l < $history_file)"

if [ $# -eq 0 ] ; then
  tail -5 $history_file
else
  if [ $1 -gt $history_lc ] ; then
    echo "History file does not go back that far."
  elif [ $1 -lt $history_lc ] ; then
    tail -$1 $history_file
  fi
fi
