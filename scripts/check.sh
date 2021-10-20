rememberfile="$HOME/.remember"

if [ ! -f $rememberfile ] ; then
  echo "$0: No remember file found."
  exit 1
fi
if [ $# -eq 0 ] ; then
  more $rememberfile
else
  grep -i -- "$@" $rememberfile | ${PAGER:-more}
fi
exit 0
