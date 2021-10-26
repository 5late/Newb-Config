history_lc="$(wc -l < history)"

if [ $# -eq 0 ] ; then
  history | tail -5
else
  if [ $1 -gt $history_lc ] ; then
    echo "History file does not go back that far."
  elif [ $1 -lt $history_lc ] ; then
    history | tail -$1
  fi
fi
