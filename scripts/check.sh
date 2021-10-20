# Credit: Wicked Cool Shell Scripts, New Starch Press

rememberfile="$HOME/.remember"

if [ ! -f $rememberfile ] ; then
  echo "$0: No remember file found."
  exit 1
fi
if [ $# -eq 0 ] ; then
  more $rememberfile
fi
if [ "$1" == "rm" ] ; then
  shift
  sed -i "/$@/d" $rememberfile
  echo "Removed all lines containing $@."
else
  grep -i -- "$@" $rememberfile | ${PAGER:-more}
fi
exit 0
