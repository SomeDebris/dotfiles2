runtime! debian.vim

set nocompatible

syntax on
syntax enable

set background=dark

"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden	
set mouse=a

set backspace=indent,eol,start 

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" TABS TO SPACES:
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

colorscheme super-awesome

set wildmenu

set hls     " highlights the last search pattern. useful!

"highlight Comment cterm=italic gui=italic

set path+=**  " Provides tab-completion for all file related tasks
set directory=.,~/tmp//

set cm=blowfish2

set completeopt=menu,longest

" TODO: set font to hack, 12pt if using gui

set ruler

set foldmethod=manual

set splitright

set linebreak

set number

if has("gui_running")
    set guifont=Hack\ 16
endif

if &term == 'alacritty'
    set ttymouse=sgr
endif

"let &showbreak = '↪ '
let &showbreak = '>'

" Maps [<space> to create line above cursor
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
" Maps ]<space> to create line below cursor
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Save a view or something.
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent loadview

set viewoptions-=options

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    
    Plug 'gregjurman/vim-nc'
    Plug 'vim-latex/vim-latex'
    Plug 'vim-python/python-syntax'
    "Plug 'tbastos/vim-lua'

    "Plug 'sudar/vim-arduino-syntax'

    "Plug 'https://github.com/ycm-core/YouCompleteMe'

    Plug 'tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-surround.git'
    Plug 'tpope/vim-commentary'

    Plug 'preservim/nerdtree'
    "Plug 'tpope/vim-vinegar'
    "Plug 'francoiscabrol/ranger.vim'

    Plug 'altercation/vim-colors-solarized'
    Plug 'airblade/vim-gitgutter'

call plug#end()
