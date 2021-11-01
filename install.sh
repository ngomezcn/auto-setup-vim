#!/bin/bash

###
# Author: ngomez
# Date: 30, October of 2021
# This script install all my essential enviorment and configurations on Linux system's based 
###

# If not root exit
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# TODO: Make a help comand to remember custom shortcuts
# TODO: Ask for git credentials
# TODO: Ask if install SDKs, frameworks, compilers...
# TODO: Add custom shortcuts to keyboard

# Global variables
# - General
user="$SUDO_USER"

# - Installation setting
ins_NerdFonts=false
ins_PowerlineFonts=false
    set_PowerlineTerminal=false
ins_YouCompleteMe=false

# - Paths/Folders
home_dir="/home/$user/"

# Colors 
BLUE='\033[0;36m'
GREEN='\033[;32m'
RED=$'\e[1;31m'
NC='\033[0m' # No color


# Functions
# - Messages
blue_printf()
{
   printf "${BLUE}$1${NC}\n"
}

throw_error()
{
   printf "${RED} ↳ stopping, an error has occurred. \n${NC}" 
   exit
}

succes_downloaded()
{
   printf "${GREEN}\nSuccessfully downloaded $1\n${NC}"    
}


succes_installed()                                    
{                                                     
   printf "${GREEN}\nSuccessfully installed $1\n${NC}"
}                                                     

rm -r $home_dir.vimrc
rm -r $home_dir.vim/
rm -r .ins_temp/YouCompleteMe/

set -e # If something goes wrong exit

# Install essential tools
#blue_printf "\nInstalling essentials tools..."
#apt --yes install vim  
#apt --yes install git  
#apt --yes install tmux # Multiplexor terminal
#apt --yes install curl 
#apt --yes install wget 

# Ask for Settings
blue_printf "\n Set installation settings:"
read -p "Do you want install Nerd Fonts? [Y/n] (will take a while):" confirm && [[ $confirm  == [yY] ]] && ins_NerdFonts=true
read -p "Do you want install Powerline Fonts? [Y/n]:" confirm && [[ $confirm  == [yY] ]] && ins_PowerlineFonts=true 
if $ins_PowerlineFonts; then   
   read -p " - Do you want set Powerline on terminal? [Y/n] (without nerd fonts it will look weird):" confirm && [[ $confirm  == [yY] ]] && set_PowerlineTerminal=true
fi


# Installation
# - Nerd Fonts
if $ins_NerdFonts; then

   
   if [ -d "nerd-fonts" ]; then
   	echo "Nerd Fonts already downloaded"
   else
	git clone https://github.com/ryanoasis/nerd-fonts
   fi
   fc-cache -fv
   wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/bin/scripts/lib/i_linux.sh -P ~/.local/share/fonts/
   source ~/.local/share/fonts/i_linux.sh

   succes_installed "Nerd Fonts"
fi

# - Powerline Fonts
if $ins_PowerlineFonts; then
   apt-get install python3-pip
   pip3 install powerline-status
   apt-get install fonts-powerline
fi

# - Powerline Terminal
if $set_PowerlineTerminal; then

   if grep -q ngomez/vim-setup $home_dir.bashrc; then
      echo "HOOOOOOOOOOOOOOOOOOOOOOOOOOOOLA"
   else
      cat conf_files/powerline_terminal/bashrc.conf >> $home_dir.bashrc
      succes_installed "Powerline Terminal"
   fi

fi

# Bundle installation
if [ -d "$home_dir.vim/bundle/" ]; then
        rm -r $home_dir.vim/bundle/
fi

git clone https://github.com/VundleVim/Vundle.vim.git $home_dir.vim/bundle/Vundle.vim
succes_installed "Bundle"

# YouCompleteMe
# - packages
apt install build-essential cmake vim-nox python3-dev
apt install mono-complete golang nodejs default-jdk npm
# - youcompleteme
git clone https://github.com/ycm-core/YouCompleteMe .ins_temp/YouCompleteMe
git -C .ins_temp/YouCompleteMe/ submodule update --init --recursive
mv .ins_temp/YouCompleteMe/ $home_dir.vim/bundle
rm -rf .ins_temp/YouCompleteMe
succes_installed "zzzz"



chown -R ubuntu $home_dir.vim/
chgrp -R ubuntu $home_dir.vim/

chown -R ubuntu $home_dir.bashrc
chgrp -R ubuntu $home_dir.bashrc

succes_installed "YouCompleteMe"

# - Installing plug autoload
curl -fLo $home_dir.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
succes_installed "Vim Plus Autoload"

# - Install VIM configurations
cp conf_files/vim/.vimrc $home_dir
cp -r conf_files/vim/.plug-config/ $home_dir.vim/
cp conf_files/tmux/.tmux.conf $home_dir
succes_installed "Vim custom configurations"


# Set user as owner
chown -R $user $home_dir.vimrc
chgrp -R $user $home_dir.vimrc

chown -R $user $home_dir.tmux.conf
chgrp -R $user $home_dir.tmux.conf

chown -R ubuntu $home_dir.vim/
chgrp -R ubuntu $home_dir.vim/

chown -R ubuntu $home_dir.bashrc
chgrp -R ubuntu $home_dir.bashrc

#printf "${GREEN}\nOpen vim and run :PlugInstall and :PluginInstall (once done exit)${NC}"


