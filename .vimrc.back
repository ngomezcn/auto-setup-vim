set encoding=UTF-8

call plug#begin()

" Syntax "
Plug 'sheerun/vim-polyglot'

" Status bar "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes "
Plug 'morhetz/gruvbox' 

" Tree "
Plug 'preservim/NERDTree'  

" tmux "
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Typing "
Plug 'jiangmiao/auto-pairs'  

" Vim icons"
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Vim Icons"
let g:webdevicons_enable_nerdtree = 1

" Theme  "
:colorscheme gruvbox 
let g:gruvbox_contrast_dark = "hard"  
:set bg=dark

" Airline "
let g:airline_theme='deus' 
let g:airline_powerline_fonts = 1
set t_Co=256

"TODO: tmux, "

" Vim"
:set number
:set nowrap                    " don't wrap lines
:set tabstop=4                 " a tab is four spaces
:set backspace=inden,eol,start " allow backspacing over everything in insert mode "
:set autoindent                " always set autoindenting on "
:set copyindent                " copy the previous indentation on autoindenting "
:set number                    " always show line numbers "
:set shiftwidth=4              " number of spaces to use for autoindenting "
:set shiftround                " use multiple of shiftwidth when indenting with '<' and '>' "
:set showmatch                 " set show matching parenthesis "
:set ignorecase                " ignore case when searching "
:set smartcase                 " ignore case if search pattern is all lowercase,     case-sensitive otherwise "
:set smarttab                  " insert tabs on the start of a line according to shiftwidth, not tabstop "
:set hlsearch                  " highlight search terms " 
:set incsearch                 " show search matches as you type "
:set history=1000              " remember more commands and search history "
:set undolevels=1000           " use many muchos levels of undo " 
:set noerrorbells  
:set mouse=a
":set title "                    " change the terminals title "
"set wildignore=*.swp,*.bak,*.pyc,*.class "