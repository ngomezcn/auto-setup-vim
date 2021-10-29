#!/bin/bash

#if [ "$EUID" -ne 0 ]
#  then echo "Please run as root"
#  exit
#fi


BLUE='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
printf "\n"

done_message () {
   printf "${GREEN}Done!${NC}\n\n"
}

apt_install ()
{
    printf "${BLUE}Installing $1...${NC}\n"
    sudo apt --yes install $1
    done_message
}

apt_install "git"
apt_install "curl"
apt_install "wget"
apt_install "tmux"
apt_install "dos2unix"
apt_install "vim"

sudo rm /home/$USER/.vimrc
cp /home/$USER/vim-setup/.vimrc /home/$USER/
sudo dos2unix /home/$USER/.vimrc

printf "${BLUE}Installing vim-plug...${NC}\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/plugin/Vundle.vim
done_message



#printf "${BLUE}Cloning nerd-fonts...${NC}\n"
#git clone https://github.com/ryanoasis/nerd-fonts
#done_message
#run ./install.sh

#printf "${BLUE}Cloning powerline-fonts...${NC}\n"
#git clone git@github.com:powerline/fonts.git
#done_message
#run ./install.sh


# Finall message
printf "${BLUE}To finish run :PluginInstall on Vim${NC}\n\n"
printf $USER