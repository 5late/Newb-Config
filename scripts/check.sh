# Credit: Wicked Cool Shell Scripts, New Starch Press
# There are some noticible differences such as the option to remove a note.

rememberfile="$HOME/.remember"

if [ ! -f $rememberfile ] ; then
  echo "$0: No remember file found."
  exit 1
fi
if [ $# -eq 0 ] ; then
  $EDITOR $rememberfile
  exit 0
fi
if [ "$1" == "rm" ] ; then
  shift
  sed -i "/$@/d" $rememberfile || echo "Error! Please wrap your remove term in ''." && exit 1
  echo "Removed all lines containing $@."
else
  grep -i -- "$@" $rememberfile | ${PAGER:-less}
fi
exit 0
