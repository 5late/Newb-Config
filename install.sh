alias_file=$HOME/.bash/aliases.bash
newb_location="$PWD"

if [ -f "$alias_file" ]; then
  echo "Found 0xMF dotfile alias file."
  echo -n "Would you like to use the recommended 'newrm' command? [y]"
  read newrmchoice
  if [ $newrmchoice == "y" ]; then
    mkdir $HOME/.config/newb/
    cp scripts/newrm.sh $HOME/.config/newb/
    cp scripts/logrm.sh $HOME/.config/newb/
    echo "alias rm=$HOME/.config/newb/logrm.sh" >> $HOME/.bash/aliases.bash
    echo "alias cleanarchive='rm -rf $HOME/.deleted-files/*'" >> $HOME/.bash/aliases.bash
    sleep 1
    echo "Updated rm command."
  fi
  echo -n "Would you like to use the cp and mv command with recommended flags? [y]"
  read cpflagchoice
  if [ $cpflagchoice == "y" ]; then
    echo "alias cp='cp -iv'" >> $HOME/.bash/aliases.bash
    echo "alias mv='mv -iv'" >> $HOME/.bash/aliases.bash
    sleep 1
    echo "Updated cp command."
  fi
else
  echo "0xMF dotfiles alias file not found, will append to $HOME/.bashrc"
  echo -n "Would you like to use the recommened 'newrm' command? [y]"
  read newrmchoice
  if [ $newrmchoice == "y" ]; then
    echo "alias rm=$newb_location/newrm.bash" >> $HOME/.bashrc
    echo "alias cleanarchive='rm -rf $HOME/.deleted-files/*'" >> $HOME/.bashrc
    sleep 1
    echo "Updated rm command."
  fi
  echo -n "Would you like to use the cp and mv command with recommended flags? [y]"
  read cpflagchoice
  if [ $cpflagchoice == "y" ]; then
    echo "alias cp='cp -iv'" >> $HOME/.bashrc
    echo "alias mv='mv -iv'" >> $HOME/.bashrc
    sleep 1
    echo "Updated cp command."
  fi
fi

package_help() {
  echo "Installing packages. Read more about these packages at https://github.com/5late/Newb-Config/#packages"
  echo
  echo "INSTALLATION OPTIONS"
  echo "options:"
  echo "g 		install general packages"
  echo "s		install sysadmin packages"
  echo "n		install networking packages"
  echo "a		install all of the above"
  echo "h		print this help message"
}
# General installation packages, some of the packages are what I use in my fork of 0xMF's dotfiles.
# It is recommended that you read #packages of the README before you install any packages from this script.

general_install() {
  if [ "$(cat /etc/*-release | grep -v VERSION | grep -vE \"^\#\" | grep ID)" == "ID=debian" ]; then
    xargs -rxa general_install.txt -- sudo apt install -y --
  elif ["$(cat /etc/*-release | grep -v VERSION | grep -vE \"^\#\" | grep ID)" == "ID=arch" ]; then
    xargs -rxa general_install.txt -- sudo pacman -S -y --
  fi

  echo "-------------------------------------------------------------------------------------"
  echo "Package locate installed. Please run sudo updatedb to update the filesystem database."
  echo "Finished installation of selected scripts/aliases. Good luck!"
}

sysadmin_install() {
  general_install
  if [ "$(cat /etc/*-release | grep -v VERSION | grep -vE \"^\#\" | grep ID)" == "ID=debian" ]; then
    xargs -rxa sysadmin_install.txt -- sudo apt install -y --
  elif ["$(cat /etc/*-release | grep -v VERSION | grep -vE \"^\#\" | grep ID)" == "ID=arch" ]; then
    xargs -rxa sysadmin_install.txt -- sudo pacman -S -y --
  fi
}

network_install() {
  general_install
  sysadmin_install
  if [ "$(cat /etc/*-release | grep -v VERSION | grep -vE \"^\#\" | grep ID)" == "ID=debian" ]; then
    xargs -rxa network_install.txt -- sudo apt install -y --
  elif ["$(cat /etc/*-release | grep -v VERSION | grep -vE \"^\#\" | grep ID)" == "ID=arch" ]; then
    xargs -rxa network_install.txt -- sudo pacman -S -y --
  fi
}

while getopts ":g:s:n:a:h" option; do
  case $option in
    h) # show help message
       package_help
       exit;;
    g) # install general packages
       general_install
       exit;;
    s) # install sysadmin packages
       sysadmin_install
       exit;;
    n) # install networking packages
       network_install
       exit;;
    a) # install all packages (same as networking)
       network_install
       exit;;
   \?) # unknown option
       echo "Invalid option"
       exit;;
  esac
done

get_choice() {
  echo -n "Please enter an option:"

  read choice

  if [ $choice == "g" ]; then
    general_install
  elif [ $choice == "s" ]; then
    sysadmin_install
  elif [ $choice == "n" ] || [ $choice == "a" ]; then
    network_install
  elif [ $choice == "h" ]; then
    package_help
    get_choice
  fi
}

package_help
get_choice
