set nocompatible
" Disable swap and backup files.
set nobackup
set nowritebackup
set noswapfile
" Enable clipboard under Windows.
set clipboard=unnamedplus,autoselect
set mouse=a
" Disable eye-candy.
set go=
" Choose the colorscheme.
let g:solarized_termtrans=1
set background=dark

" Session.vim settings.
set sessionoptions=globals,buffers,curdir,folds,tabpages
" Make searches ignore case-sensitive, and incremental.
set ignorecase
set smartcase
set incsearch
" Enable line numbering.
set number
" Enable syntax colouring.
syn on
" Disable line wrapping.
set nowrap
" Enable auto indenting.
set autoindent
set smartindent
set cindent
" Set tab width to 4 characters.
set tabstop=4
set expandtab
set shiftwidth=4
" Enable automatic line break at the 76th character.
set textwidth=76
" Allow search highlighting
set hlsearch
" Backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Disable F1 for help.
map <F1> <nop>
imap <F1> <nop>

" Make errors search in open tabs, then open a new tab if not found the
" buffer.
set switchbuf=usetab,newtab

" Attempt to remap the leader character to ","
let mapleader = ","
" Suggested by NERD Commenter.
filetype plugin on
" Map a command to cd to current folder.
command! CdHere cd %:p:h
" Map a command to run a file.
let RunFile='./build/a.out'
command -nargs=* R
\ | exe '!' . RunFile . ' <args>'

set laststatus=2
set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" Set make-program to scons.
set makeprg=scons
