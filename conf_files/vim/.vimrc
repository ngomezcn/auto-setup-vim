let g:polyglot_disabled = ['markdown']
set nocompatible            
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required


call plug#begin()

"Syntax"
Plug 'sheerun/vim-polyglot'

"Status bar"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Git"
Plug 'tpope/vim-fugitive'

"Tree"
Plug 'preservim/NERDTree'  

"Themes"
Plug 'sainnhe/edge' 

"Typing"
Plug 'jiangmiao/auto-pairs'  
Plug 'alvan/vim-closetag'

"Tmux
Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'

"Vim icons (must be the last)"
"Plug 'ryanoasis/vim-devicons'

call plug#end()
"=================================================="
"=================================================="

"NERDTree.conf" 
source ~/.vim/.plug-config/.NERDTree.conf

"Edge.conf"    
source ~/.vim/.plug-config/.Edge.conf

"Airline.conf" 
source ~/.vim/.plug-config/.Airline.conf

"TMUX.config "
"MultiWindow: TMUX | https://github.com/tmux/tmux/issues/1246"

"Tmux-Navigator"
"source ~/.vim/.plug-config/.Tmux-Navigator.conf

""""""""""""""""""""""
" General Vim config "
""""""""""""""""""""""
set encoding=UTF-8
set number
set t_Co=256
set history=1000         
set undolevels=1000       
"set mouse=a
    

