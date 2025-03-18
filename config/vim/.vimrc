set nocompatible

" enable syntax highlighting
syntax enable
filetype plugin on

" Set tab settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Highlight search results
set hlsearch

" Enable smartindent
set smartindent

" Disable text wrapping
set nowrap

" Show line numbers and relative line numbers
set number
set relativenumber

" Search subfolders
set path=$PWD/**

" Set wildmode
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags

" Set completion options
set completeopt=menuone,longest,preview
set complete=.,t,w,b,u

" Set ignorecase and smartcase
set ignorecase
set smartcase

" Move cursor with split
set splitbelow
set splitright

" Set scrolloff and sidescrolloff
set scrolloff=8
set sidescrolloff=5

" Confirm before writing or abandoning a modified buffer
set confirm

" Set colorcolumn
set colorcolumn=120

" Disable folding by default
set nofoldenable

" Status bar
set laststatus=2

" Colors
hi Normal guibg=NONE ctermbg=NONE
hi Pmenu ctermbg=gray guibg=gray

" Set leader and local leader
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Map k and j to move by terminal rows
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain cursor position when yanking a visual selection
vnoremap y y`]

" Paste replace visual selection without copying it
vnoremap p "_dP

" Clear search highlighting
nnoremap <leader>k :nohlsearch<CR>

" Close buffers
nnoremap <leader>q :bd<CR>
nnoremap <leader>Q :%bd<CR>

" Save buffers
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>

" Select open buffers
nnoremap <leader>b :b<Space>

" Start find
nnoremap <leader>f :find<Space>

" Start search
nnoremap <leader>s :vimgrep // **<Left><Left><Left><Left>
nnoremap gr :grep! --exclude=tags --exclude-dir=.git -si "\<<cword>\>" . -r<CR>:copen<CR>
nnoremap gt <C-]>

" Fixlist
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>
nnoremap <leader>c :copen<CR>

" Open quickfixlist after search
augroup searchlist
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" Marks
nnoremap <leader>U mU
nnoremap <leader>I mI
nnoremap <leader>O mO
nnoremap <leader>Z mZ

nnoremap <leader>u 'U
nnoremap <leader>i 'I
nnoremap <leader>o 'O
nnoremap <leader>z 'Z

" Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open explorer
nnoremap - :Explore<CR>

" Registers and clipboard
"
" Use system clipboard
set clipboard+=unnamedplus

" Mapping for "c" and "C"
nnoremap c "cc
vnoremap c "cc
nnoremap C "cC
vnoremap C "cC

" Mapping for "d" and "D"
nnoremap d "dd
vnoremap d "dd
nnoremap D "dD
vnoremap D "dD

" Mapping for "x" and "X"
nnoremap x "xx
vnoremap x "xx
nnoremap X "xX
vnoremap X "xX

" Mapping for "s" and "S"
nnoremap s "ss
vnoremap s "ss
nnoremap S "sS
vnoremap S "sS
