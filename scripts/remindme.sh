rememberfile="$HOME/.remember"

if [ $# -eq 0 ] ; then
  echo "Enter content to remember. Exit with ^D: "
  cat - >> $rememberfile
else
  echo "$@" >> $rememberfile
fi
exit 0
