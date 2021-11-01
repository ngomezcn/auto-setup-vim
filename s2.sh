#!/bin/bash
set -e
user=$(whoami)
home_dir="/home/$user/" 
python3 $home_dir.vim/bundle/YouCompleteMe/install.py --all
