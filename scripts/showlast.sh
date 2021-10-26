history_lc="$(history | wc -l)"

if [ $# -eq 0 ] ; then
  history | cut -d' ' -f 4- | tail -5
else
  if [ $1 -gt $history_lc ] ; then
    echo "History file does not go back that far."
  elif [ $1 -lt $history_lc ] ; then
    history | cut -d' ' -f 4- | tail -$1
  fi
fi
