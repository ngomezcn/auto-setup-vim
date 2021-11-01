#!/bin/bash
set -e

GREEN='\033[;32m'
NC='\033[0m' # No color

user=$(whoami)
home_dir="/home/$user/" 
python3 $home_dir.vim/bundle/YouCompleteMe/install.py --all
printf "${GREEN} ↳ Successfully installed, to finish open Vim and run :PlugInstall and :PluginInstall (ingore vim errors) $1\n${NC}"
