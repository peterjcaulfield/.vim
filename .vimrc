""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" initialise plugin manager
call pathogen#incubate()
call pathogen#helptags()
execute pathogen#infect()
filetype plugin on
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set nocompatible   " Disable vi-compatibility

set t_Co=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"let g:solarized_termcolors=16
set background=dark
colorscheme sexy-railscasts-256 
syntax on                       " Enable highlighting for syntax
set guifont=Droid\ Sans\ Mono\ For\ Powerline:h16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
set clipboard=unnamed 
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
set foldmethod=manual
set wildignore+=*/vendor/**     " I don't want to pull up these folders/files when calling CtrlP
 
highlight Search cterm=underline
 
" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
 
" enable phpfolding.vim only on php files
let g:DisableAutoPHPFolding = 1

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'
 
"insert code comment asterisk for new comment lines
:set formatoptions+=r

"Show (partial) command in the status line
set showcmd
 
let g:miniBufExplorerAutoStart=1 

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 
" Abbreviations
abbrev pft PHPUnit_Framework_TestCase
 
" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
 
" save and load folds 
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

au FileType php EnableFastPHPFolds

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saves
nmap <leader>w :w!<cr>

nmap <leader>t :CtrlP<cr>

nmap <leader>d :Dash<cr>

nmap <leader>x :MBEbd<cr>
 
" Down is really the next line
nnoremap j gj
nnoremap k gk
 
"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
 
"easier window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
 
"Resize splits
nmap <C-h> :vertical resize +5<cr>
nmap <C-j> :vertical resize -5<cr>
nmap <C-k> :res +5<cr>
nmap <C-l> :res -5<cr>
nmap 50 <c-w>=

nmap <C-a> :NERDTreeToggle<cr>
 
"Load the current buffer in Chrome
"nmap ,c :!open -a Google\ Chrome<cr>

"source the current file
nmap <leader>s :!source %<cr> 

" list buffers
  
"Open files in directory of current file
nmap <leader>l :ls<cr>

" create xdebug breakpoint
nmap <leader>b :Breakpoint<cr>

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
 
" Remove search results
command! H let @/=""
 
" Edit todo list for project
nmap ,todo :e todo.txt<cr>
 
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" toggle folds with spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Easy escaping to normal mode
imap jj <esc> 

" Insert hash rocket
imap <c-l> <space>=><space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting conig 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" docblocks get highlighting for @ declarations
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree Config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" space bar to open dirs
let NERDTreeMapActivateNode='<space>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Xdebug configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin config
let  g:vdebug_options = { 
\ "break_on_open" : 0,
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-php-cs-fixer config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_enable_default_mapping = 0     

nmap <leader>f :call PhpCsFixerFixFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
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

" Execute current file 
" TODO: add execs for other common filetypes: python etc
function! ExecFile()
    let filetype = &ft
    if filetype == "php"
        :!php -d display_errors %        
    else
        :echo "filetype: " . filetype 
        :echo "execute binding for this filetype is not present in vimrc"
    endif
endfunction 

nmap <leader>r :call ExecFile()<cr>
