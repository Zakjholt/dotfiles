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
set shiftwidth=2
set smartindent
set autoindent
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
Plug 'mxw/vim-jsx'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'PProvost/vim-ps1'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'w0ng/vim-hybrid'
call plug#end()

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#quickfix_enabled = 0

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|*.swp|*.exe'

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Clojure rainbow parens
let g:rainbow_active = 1

" Nerdtree
" Close vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Show hidden files in nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
function MyNerdToggle()
  if &filetype == 'nerdtree'
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction
" Open with ctrl + n
map <C-n> :call MyNerdToggle()<CR>

" JSX highlighting
let g:jsx_ext_required = 0

set background=dark
colorscheme hybrid
