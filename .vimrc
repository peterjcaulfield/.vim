""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" initialise plugin manager
call pathogen#incubate()
call pathogen#helptags()
execute pathogen#infect()
filetype plugin indent on
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set nocompatible   " Disable vi-compatibility

set viminfo+=n~/.vim/.viminfo
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
set wildignore+=*/vendor/**,*/node_modules/**,*/bower_components/**     " I don't want to pull up these folders/files when calling CtrlP

"" Make it obvious where 80 characters is
set colorcolumn=80
set textwidth=80

 
highlight Search cterm=underline
 
" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" enable phpfolding.vim only on php files
let g:DisableAutoPHPFolding = 1

" Easy motion stuff
" let g:EasyMotion_leader_key = '<Space>'

"insert code comment asterisk for new comment lines
"set formatoptions+=r

"Show (partial) command in the status line
set showcmd
 
let g:miniBufExplorerAutoStart=1 

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
map \<Space> <Plug>(easymotion)
 

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
 
" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
 
" save and load folds 
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

au FileType php EnableFastPHPFolds

" we want relative line numbers when moving around and absolute in insert
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

autocmd Filetype javascript set ts=2 sw=2 sts=0 expandtab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default easy motion search with one key stroke
nmap s <Plug>(easymotion-s2)

" Fast saves
"nmap <leader>w :w!<cr>

nmap <leader>g :CtrlP<cr>

nmap <leader>d :Dash<cr>

nmap <leader>x :MBEbd<cr>

nmap <leader>t :!clear && phpunit -c %:p:h/../phpunit.xml %<cr>

nmap ,g :echo "leader is now space!"<cr>
nmap ,s :echo "leader is now space!"<cr>
 
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
"nmap <leader>s :!source %<cr> 
"home row fast saves
nmap <leader>s :w!<cr> 

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
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Easy escaping to normal mode
imap jj <esc> 

" Insert hash rocket
imap <c-l> <space>=><space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode mappings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap . :norm.<CR>

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
" Syntastic Config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_javascript_checkers = ['jshint', 'gjslint']
"let g:syntastic_javascript_checkers = ['eslint']
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

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
" ultisnips config 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger = "<nop>"
"let g:ulti_expand_or_jump_res = 0

"function ExpandSnippetOrCarriageReturn()
    "let snippet = UltiSnips#ExpandSnippetOrJump()
    "if g:ulti_expand_or_jump_res > 0
        "return snippet
    "else
        "return "\<CR>"
    "endif
"endfunction
"inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
"let g:snips_author="Peter Caulfield"

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
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

" Execute current file 
" TODO: add execs for other common filetypes: python etc
function! ExecFile()
    let filetype = &ft
    if filetype == "php"
        :!php -d display_errors %        
    elseif filetype == "javascript"
        :!node -p "$(cat %)"
    elseif filetype == "python"
        :!python %
    else
        :echo "filetype: " . filetype 
        :echo "execute binding for this filetype is not present in vimrc"
    endif
endfunction 

nmap <leader>r :call ExecFile()<cr>
