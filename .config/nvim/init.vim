"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on

set showmatch
set ignorecase
set smartcase
set autowrite
set mouse=a

" python configuration
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

set backspace=indent,eol,start 

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" set termguicolors

" TABS TO SPACES:
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set wildmenu

set hls     " highlights the last search pattern. useful!

"highlight Comment cterm=italic gui=italic

set path+=**  " Provides tab-completion for all file related tasks
set directory=.,~/tmp//

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

"let &showbreak = '↪ '
let &showbreak = '>'

" Maps [<space> to create line above cursor
nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
" Maps ]<space> to create line below cursor
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Save a view or something.
" autocmd BufWritePost,BufLeave,WinLeave ?* mkview
" autocmd BufReadPre,BufWinEnter ?* silent! loadview
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent! loadview

set viewoptions-=options

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

let g:vimtex_view_general_viewer = 'evince'
" let g:vimtex_compiler_method = 'lualatex'
let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-lualatex',
        \ 'pdfdvi'           : '-pdfdvi',
        \ 'pdfps'            : '-pdfps',
        \ 'pdflatex'         : '-pdf',
        \ 'luatex'           : '-lualatex',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    
    Plug 'gregjurman/vim-nc'
    " Plug 'vim-latex/vim-latex'
    Plug 'vim-python/python-syntax'
    "Plug 'tbastos/vim-lua'

    "Plug 'sudar/vim-arduino-syntax'

    "Plug 'https://github.com/ycm-core/YouCompleteMe'

    Plug 'tpope/vim-fugitive'
    Plug 'jreybert/vimagit'

    Plug 'https://github.com/tpope/vim-surround.git'
    Plug 'tpope/vim-commentary'

    Plug 'preservim/nerdtree'
    "Plug 'tpope/vim-vinegar'
    "Plug 'francoiscabrol/ranger.vim'

    Plug 'altercation/vim-colors-solarized'
    Plug 'airblade/vim-gitgutter'

    Plug 'neovim/nvim-lspconfig'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    " Plug 'Shougo/ddc.vim'
    " Plug 'vim-denops/denops.vim'
    " Plug 'Shougo/ddc-ui-native'
    " Plug 'Shougo/ddc-source-around'
    " Plug 'Shougo/ddc-matcher_head'
    " Plug 'Shougo/ddc-sorter_rank'

    Plug 'lervag/vimtex'

call plug#end()

"industry-nvim is my custom thing based on the vim9 one
colorscheme industry-nvim

let g:livepreview_engine = 'lualatex'
