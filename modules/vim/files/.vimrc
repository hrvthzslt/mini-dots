" -----------------------------------------------------------------------------
" General options
" -----------------------------------------------------------------------------

" Disable compatibility with vi
set nocompatible

" Enable syntax highlighting
syntax enable
filetype plugin on

" Set tab settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Highlight search results
set hlsearch

" Smart indentation when starting a new line
set smartindent

" Disable text wrapping
set nowrap

" Show line numbers and relative line numbers
set number
set relativenumber

" Confirm before writing or abandoning a modified buffer
set confirm

" Allow buffers to be hidden, ergo switch buffers without saving
set hidden

" Move cursor with split
set splitbelow
set splitright

" Set scrolloff and sidescrolloff
set scrolloff=8
set sidescrolloff=5

" Line length marker at 120 characters
set colorcolumn=120

" Disable folding by default
set nofoldenable

" Always show status line
set laststatus=2

" Should not do it but it annoys me
set noswapfile

" Skip shell and completion messages
set shortmess+=Fc

" Colors for pmenu
hi Pmenu ctermbg=white guibg=white
hi PmenuSel ctermbg=yellow guibg=yellow

" -----------------------------------------------------------------------------
" General mappings
" -----------------------------------------------------------------------------

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

" Send cut, delete, change, and substitute to named registers
nnoremap c "cc
nnoremap cc "ccc
vnoremap c "cc
nnoremap C "cC
nnoremap d "dd
nnoremap dd "ddd
vnoremap d "dd
nnoremap D "dD
vnoremap D "dD
nnoremap x "xx
vnoremap x "xx
nnoremap X "xX
vnoremap X "xX
nnoremap s "ss
vnoremap s "ss
nnoremap S "sS
vnoremap S "sS

" Ctrl+hjkl to move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Exit terminal insert mode
tnoremap <C-x> <C-\><C-n>

" Set leader and local leader for further mappings
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Clear search highlighting
nnoremap <leader>k :nohlsearch<CR>

" Close buffers
nnoremap <leader>q :bd<CR>
nnoremap <leader>Q :%bd<CR>

" Save buffers
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>

" Show diff between panes
nnoremap <leader>ff :windo diffthis<CR>
nnoremap <leader>fo :windo diffoff<CR>

" -----------------------------------------------------------------------------
" File navigation
" -----------------------------------------------------------------------------

" Search in current path recursively
set path=**

" Set wildmode for command menu completion
set wildmenu
set wildoptions=pum
set wildmode=longest:full,full
set wildignorecase
set wildignore=tags

" Search and open buffers
nnoremap <leader>sb :b<Space>
" Search and open files in path
nnoremap <leader>sf :find<Space>

" Alternate file
nnoremap <leader>j :e #<CR>

" Open file explorer
nnoremap - :Explore<CR>

" Marks for quick navigation and bookmarking
nnoremap <leader>U mU :echo "Mark U set"<CR>
nnoremap <leader>I mI :echo "Mark I set"<CR>
nnoremap <leader>O mO :echo "Mark O set"<CR>
nnoremap <leader>Z mZ :echo "Mark Z set"<CR>
nnoremap <leader>Y mZ :echo "Mark Y set"<CR>

nnoremap <leader>u 'U
nnoremap <leader>i 'I
nnoremap <leader>o 'O
nnoremap <leader>z 'Z
nnoremap <leader>y 'Z

" Automatically update custom marks (U, I, O, Z) to current cursor position on buffer leave
function! UpdateCustomMarks()
    for mark in ['U', 'I', 'O', 'Z']
        let l:markpos = getpos("'" . mark)
        if l:markpos[0] == bufnr('') && l:markpos[1] > 0
            execute 'normal! m' . mark
        endif
    endfor
endfunction
augroup mark_cursor_persistence
    autocmd!
    autocmd BufLeave * call UpdateCustomMarks()
augroup END

" -----------------------------------------------------------------------------
" Code navigation
" -----------------------------------------------------------------------------

" Search in files
nnoremap <leader>sg :vimgrep // **<Left><Left><Left><Left>

" Search for current word under cursor
function! SearchForReferences()
    let l:ext = expand('%:e')
    if l:ext == ''
        let l:glob = '{**/*,**/.*}'
    elseif l:ext == 'c' || l:ext == 'h'
        let l:glob = '**/*.{c,h}'
    else
        let l:glob = '**/*.' . l:ext
    endif
    execute 'silent! vimgrep /\C\<' . expand('<cword>') . '\>/gj ' . l:glob
    copen
endfunction
nnoremap gr :call SearchForReferences()<CR>
" nnoremap gr :grep! --binary-files=without-match --exclude=tags --exclude-dir=.git -s "\<<cword>\>" . -r<CR><CR>:copen<CR>

" Go to tag if present, else go to local declaration
function! GoToTagOrDeclaration()
    try
        execute 'tag ' . expand('<cword>')
    catch
        execute 'normal! gd'
    endtry
endfunction
nnoremap gd :call GoToTagOrDeclaration()<CR>

" Generate tags file with ctags
nnoremap <leader>t :execute '!ctags -R .'<CR><CR>:echo "Tags regenerated"<CR>

" -----------------------------------------------------------------------------
" Auto-completion
" -----------------------------------------------------------------------------

" Set completion options
set completeopt=menuone,longest,preview,noselect,noinsert
set complete=.,t,w,b,u

" Open completion menu automatically while typing
function! OpenCompletion()
    " Only trigger in file buffers
    if &buftype == 'nofile'
        return
    endif
    try
        if !pumvisible()
            call feedkeys("\<C-n>", "n")
        endif
    catch
    endtry
endfunction
augroup auto_completion
    autocmd!
    autocmd InsertCharPre * call OpenCompletion()
augroup END

" Enable and map omnifunc for all filetypes
augroup omnifunc_setup
    autocmd!
    autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
    inoremap <C-o> <C-x><C-o>
augroup END

" Ignore case in completion unless uppercase letters are used
set ignorecase
set smartcase

" -----------------------------------------------------------------------------
" Programming support
" -----------------------------------------------------------------------------

" Easy access to man pages
nnoremap K K<CR>
vnoremap K K<CR>

" Run makeprg with make
nnoremap <silent> <leader>ll :make<CR>

augroup ece_cycle
    autocmd!

    " Source vim config instead of make
    autocmd FileType vim nnoremap <buffer> <leader>ll :source %<CR>

    " Rune makeprg for c/cpp files
    autocmd FileType c,cpp nnoremap <buffer> <silent> <leader>ll :make<CR><CR><CR>

    " Makeprg per filetype
    autocmd FileType sh setlocal makeprg=shellcheck\ -f\ gcc\ -x\ %:p
    autocmd FileType sh nnoremap <buffer> <silent> <leader>ll :make<CR><CR>

    autocmd FileType python setlocal makeprg=ruff\ check\ --output-format\ concise\ %
    autocmd FileType python nnoremap <buffer> <silent> <leader>ll :make<CR><CR><CR>

    autocmd FileType c,cpp nnoremap <buffer> <silent> <leader>ll :make<CR><CR><CR>
augroup END

" Format files by filetype
function! FormatWithCursor(cmd) range
    let l:save_cursor = getpos(".")
    if a:firstline == a:lastline
        execute '%!' . a:cmd
    else
        execute a:firstline . ',' . a:lastline . '!' . a:cmd
    endif
    call setpos('.', l:save_cursor)
endfunction

augroup external_formatters
    autocmd!
    autocmd FileType sh nnoremap <buffer> <leader>lf :call FormatWithCursor('shfmt -i 2 -ci')<CR>
    autocmd FileType sh vnoremap <buffer> <leader>lf :call FormatWithCursor('shfmt -i 2 -ci')<CR>

    autocmd FileType c,cpp nnoremap <buffer> <leader>lf :call FormatWithCursor('clang-format')<CR>
    autocmd FileType c,cpp vnoremap <buffer> <leader>lf :call FormatWithCursor('clang-format')<CR>

    autocmd FileType python nnoremap <buffer> <leader>lf :call FormatWithCursor('ruff format -')<CR>
    autocmd FileType python vnoremap <buffer> <leader>lf :call FormatWithCursor('ruff format -')<CR>
augroup END

" Fixlist nacigation mappings
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>
nnoremap <leader>c :copen<CR>

" Open quickfixlist after search
augroup searchlist
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost make cwindow
augroup END

" -----------------------------------------------------------------------------
" Override with local conf
" -----------------------------------------------------------------------------

" Automatically source local .vimrc.local on startup and when changing directories
function! SourceLocalVimrc()
    let l:local_vimrc_path = getcwd() . '/.vimrc.local'
    if filereadable(l:local_vimrc_path)
        execute 'source ' . fnameescape(l:local_vimrc_path)
        echo "Sourced " . l:local_vimrc_path
    endif
endfunction
augroup local_vimrc
    autocmd!
    autocmd VimEnter * call SourceLocalVimrc()
augroup END
