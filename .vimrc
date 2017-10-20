runtime! plugin/sensible.vim
set term=screen-256color
set t_ut=
set dir=/tmp//
set runtimepath^=~/.vim
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set hlsearch
set wildchar=<Tab> wildmode=full
set tabstop=2
set softtabstop=2
set expandtab
set number
set showcmd
set lazyredraw
set showmatch
set path+=**

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql']}
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'PProvost/vim-ps1'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
call plug#end()

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|*.swp|*.exe'

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Clojure rainbow parens
let g:rainbow_active = 1

" Remap pane switching
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Nerdtree
" Open on directory or without files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open with ctrl + n
map <C-n> :NERDTreeToggle<CR>
" Close vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Show hidden files
let NERDTreeShowHidden=1
