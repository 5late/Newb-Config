removelog="$HOME/.removelog"
location="$PWD"

if [ $# -eq 0 ] ; then
  echo "Usage: $0 [-s] list of files and directores" >&2
  exit 1
fi

if [ "$1" = "-s" ] ; then
  # Will not log
  shift
else
  echo "$(date): ${USER}: ${PWD} $@" >> $removelog
fi

$HOME/.config/newb/newrm.sh "$@"
exit 0
