call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let mapleader="," 	" change the mapleader from \ to ,
nnoremap ; :

" ----------------------------------------
" Basic Mappings
" ----------------------------------------

" clear shearch highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" open/reload .vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>_
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

" ----------------------------------------
" Window Settings
" ----------------------------------------

set cmdheight=2 " set command line height to 2 lines

" ----------------------------------------
" Text Editing
" ----------------------------------------

" Enable syntax highlighting
syntax on

filetype plugin indent on

set nowrap			" disable wordwrap
set tabstop=4		" Set tabstop to 4 spaces
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=4	" number of spaces used for each step of (auto)indent
set shiftround
set smartindent 	" enable smart indent
set number			" show line numbers
set showmatch		" show matching parenthesis

set smarttab		" insert tabs on the start of a line according to shiftwidth, not tabstop

set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase, case-sensetive otherwise
set hlsearch		" highlight search terms
set incsearch		" show search matches as you type

set wildignore=*.swp,*.bak,*.pyc,*.class

set visualbell		" don't beep
set noerrorbells	" don't beep

" don't write backup files
set nobackup
set noswapfile

" highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" ------------------------------------------------------------

if has('autocmd')
	autocmd filetype python set expandtab
endif

" ----------------------------------------
" Command-T Plugin settings
" ----------------------------------------

let g:CommandTMaxHeight=20

" ----------------------------------------
" LustJuggler Plugin settings
" ----------------------------------------

nmap <leader>jb :LustyJuggler<CR>
