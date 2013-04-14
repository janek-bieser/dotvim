" setup pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let mapleader="," " change the mapleader from \ to ,
nnoremap ; :

" ----------------------------------------
" Basic Mappings
" ----------------------------------------

" clear shearch highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" open/reload .vimrc
map <leader>v :vsp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" toggle spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" copy to clipboard
nmap <leader>y "*y
nmap <leader>Y "*yy
nmap <leader>p "*p

" make cursor move up/down in rows instead of lines
" stops cursor from skipping lines when wordwrap is turned on
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" trigger clang_complete completion
imap <c-space> <c-x><c-u>


" ----------------------------------------
" Text Editing
" ----------------------------------------

" Enable Mouse
set mouse=a

" Enable syntax highlighting
syntax on

filetype plugin indent on

" wordwrap behavior
set nowrap
set sidescroll=1
set sidescrolloff=1

" highlight whitespace
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:.

" tabstop configuration
set tabstop=4
set smarttab
set shiftwidth=4
set autoindent
set smartindent
set shiftround " round indent to multiple of 'shiftwidth'

set backspace=indent,eol,start
set showmatch " show matching parenthesis

" searching behavior
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase, case-sensetive otherwise
set hlsearch		" highlight search terms
set incsearch		" show search matches as you type

" buffer settings
set wildignore=*.swp,*.bak,*.pyc,*.class
set hidden " allows closing buffer without saving

" don't beep
set visualbell
set noerrorbells

" don't write backup files
set nobackup
set noswapfile


" FileType specific settings ---------------------------------

if has('autocmd')
	" use spaces instead of tabs in python files
	autocmd filetype python setlocal expandtab

	" use word wrap
	autocmd filetype text,markdown setlocal wrap nolist linebreak formatoptions=l

	" disable line numbers when editing plaintext
	autocmd filetype text setlocal nonumber
endif


" ----------------------------------------
" GUI Settings
" ----------------------------------------

" command line
set cmdheight=1
set wildmenu

" show line numbers
set number

" enable status line
set laststatus=2

" set font-family and size
set guifont=Anonymous\ Pro:h14

if has('gui_running')
	colorscheme Tomorrow-Night
endif


" ----------------------------------------
" UltiSnips Plugin settings
" ----------------------------------------

let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ----------------------------------------
" Command-T Plugin settings
" ----------------------------------------

let g:CommandTMaxHeight=30

" ----------------------------------------
" Clang Complete Plugin settings
" ----------------------------------------

let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'

" ----------------------------------------
" LustJuggler Plugin settings
" ----------------------------------------

nmap <leader>jb :LustyJuggler<CR>


" ----------------------------------------
" eclim Plugin settings
" ----------------------------------------
let g:acp_behaviorJavaEclimLength=3
