"¬O§_¨Ì¾Úµ{¦¡¬ÛÃö»yªkÅã¥Ü¤£¦PÃC¦â
set t_Co=256
syntax enable
colorscheme ir_black
"colorscheme railscasts
"colorscheme symfony

set fileencodings=utf-8,big5

set nocompatible

set backspace=indent,eol,start

" ¤£¦Û°ÊÁY±Æ
set noautoindent
" filetype off                   " required!
" filetype plugin indent on     " required! 
filetype indent on     " required! 

set history=100

set ruler

set showcmd

set incsearch

map Q gq

vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

set hlsearch

"filetype plugin indent on
"filetype plugin on

autocmd FileType text setlocal textwidth=78

autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif

set pastetoggle=[21~

" °² Tab ªø«×
set softtabstop=4
set shiftwidth=4

set expandtab
set tabstop=4

set nobackup
set nowritebackup

set modeline

map!  
"set term=xterm-256color

" Messages
au BufNewFile,BufRead /var/log/*log,/var/log/cron,/var/log/apcupsd.events,/var/log/dmesg*,/var/log/ipfw*,/var/log/ipf*,/var/log/mount*,/var/log/pf*,/var/log/ligttpd/*log  setf messages

" Pam conf
au BufNewFile,BufRead /usr/local/etc/pam.d/*	    setf pamconf

" tcsh conf
au BufNewFile,BufRead *.tcsh	    setf tcsh

" Vundle
"set nocompatible               " be iMproved

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required! 
"undle 'gmarik/vundle'

" My Bundles here:
"undle 'scrooloose/nerdtree'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Key Mapping
" inoremap ( ()<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i
" inoremap [ []<Esc>i
" inoremap { <CR>{<CR>}<Esc>ko    
" inoremap {{ {}<ESC>i

set bg=dark
"color evening  " Same as :colorscheme evening
"hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
"hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

