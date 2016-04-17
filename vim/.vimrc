set nocompatible

" Pathogen
"call pathogen#infect()
"call pathogen#helptags()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

syntax on

set hlsearch
set ignorecase
set autoindent
set history=1000
set cursorline
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Nerdtree
"autocmd vimenter * NERDTree
"let NERDTreeShowBookmarks=0
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
"let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
"let NERDTreeKeepTreeInNewTab=0
"let g:nerdtree_tabs_open_on_gui_startup=0

set background=dark
colorscheme wombat

" jaequery
nnoremap n nzz
nnoremap } }zz
nnoremap { {zz
nnoremap H Hzz
nnoremap L Lzz
set scrolloff=10
set noswapfile
set gdefault
set wildmode=longest,list

