alias_file=$HOME/.bash/aliases.bash
newb_location="$PWD"

if [ -f "$alias_file" ]; then
  echo "Found 0xMF dotfile alias file."
  echo "alias rm=$newb_location/scripts/newrm.bash" >> $HOME/.bash/aliases.bash
else
  echo "0xMF dotfiles alias file not found, will append to $HOME/.bashrc"
  echo "alias rm=$newb_location/scripts/newrm.bash" >> $HOME/.bashrc
fi
