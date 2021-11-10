# Credit: Wicked Cool Shell Scipts, No Starch Press
# Original script from WCSS differs slightly

removelog="$HOME/.removelog"

if [ $# -eq 0 ] ; then
  echo "Usage: $0 [-s] list of files and directores" >&2
  exit 1
fi

if [[ "$1" == "-s" ]] ; then
  # Will not log
  shift
else
  echo "$(date): ${USER}: ${PWD} $@" >> $removelog
fi

$HOME/.config/newb/newrm.sh "$@"
exit 0
