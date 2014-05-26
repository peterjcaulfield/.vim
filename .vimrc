call pathogen#incubate()
call pathogen#helptags()
execute pathogen#infect()

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set nocompatible   " Disable vi-compatibility

set t_Co=256
 
colorscheme xoria256
syntax on                       " Enable highlighting for syntax
set guifont=Droid\ Sans\ Mono\ For\ Powerline:h16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
 
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   "Save on buffer switch
set mouse=a

set wildmode=longest,list       "format wildmenu tab completion 
set wildmenu                    "make tab completion for files/buffers act like bash 

 
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
 
" Fast saves
nmap <leader>w :w!<cr>
 
" Down is really the next line
nnoremap j gj
nnoremap k gk
 
"Easy escaping to normal model
imap jj <esc> 
 
"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
 
"easier window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
 
"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>
 
"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>

"execute the current php file we are editing (this should be made to allow for diff file types eventually)
nmap <leader>r :!php -d display_errors %<cr>

"source the current file
nmap <leader>s :!source %<cr> 

"Open files in directory of current file
map <leader>e :edit %%<cr>

"insert code comment asterisk for new comment lines
:set formatoptions+=r

"Show (partial) command in the status line
set showcmd
 
" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
 
highlight Search cterm=underline
 
" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
 
" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>
 
" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'
 
" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
 
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
 
" Remove search results
command! H let @/=""
 
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 
" Abbreviations
abbrev pft PHPUnit_Framework_TestCase
 
" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
 
" Edit todo list for project
nmap ,todo :e todo.txt<cr>
 
" CtrlP Stuff
 
" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
"map <C-r> :CtrlPBufTag<cr>
 
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
 
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
