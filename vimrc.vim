" dldg/vimrc. Loaded from ~/.vimrc (see install.sh). Linux and macOS.

" --- Basic Setup ---
set nocompatible
let mapleader = ","      " set before any <leader> mapping
set encoding=utf-8
filetype plugin indent on
syntax on

" --- Swap, Backup, Undo ---
set nobackup
set nowritebackup
set noswapfile
" Persistent undo across sessions
if has('persistent_undo')
    let s:undodir = expand('~/.vim/undo')
    if !isdirectory(s:undodir)
        call mkdir(s:undodir, 'p', 0700)
    endif
    let &undodir = s:undodir . '//'
    set undofile
endif

" --- UI & Visuals ---
set number              " line numbers
set nowrap              " no soft wrapping
set laststatus=2        " always show the status line
set ruler
set showcmd
set showmatch           " flash matching bracket
set scrolloff=5         " keep 5 lines visible around the cursor
set wildmenu            " command-line completion menu
set wildmode=longest:full,full
set hidden              " switch buffers without saving
set mouse=a
if has('termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
    set termguicolors
endif
set background=dark
silent! colorscheme elflord

" --- Indentation ---
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" --- Search ---
set ignorecase          " ignore case when searching...
set smartcase           " ...unless the query contains capitals
set incsearch
set hlsearch
" Clear search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" --- Clipboard (needs a +clipboard build: vim-gtk3 on Ubuntu, Homebrew vim on macOS) ---
if has('clipboard')
    if has('mac') || has('macunix')
        set clipboard=unnamed
    else
        set clipboard=unnamedplus
    endif
endif

" --- Formatting ---
set backspace=indent,eol,start

" --- Mappings ---
" Disable F1 help
map <F1> <nop>
imap <F1> <nop>

" Quick directory change
command! CdHere cd %:p:h

" --- Sessions & Buffers ---
set sessionoptions=globals,buffers,curdir,folds,tabpages
set switchbuf=usetab,newtab

" --- Statusline ---
set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" --- Filetype-specific ---
augroup devenv
    autocmd!
    " Hard-wrap prose at 76 columns, not code
    autocmd FileType text,markdown,gitcommit setlocal textwidth=76
    autocmd FileType gitcommit setlocal textwidth=72
    " Build C/C++ with scons; other filetypes keep 'make'
    autocmd FileType c,cpp setlocal makeprg=scons
    " Makefiles need real tabs
    autocmd FileType make setlocal noexpandtab
    " 2-space indent for markup/config
    autocmd FileType yaml,json,html,css,javascript,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" --- Run ---
" :R [args] runs g:RunFile (default ./build/a.out)
let g:RunFile = get(g:, 'RunFile', './build/a.out')
command! -nargs=* R execute '!' . g:RunFile . ' <args>'
