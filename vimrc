call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" change the mapleader from \ to ,
let mapleader=","

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

" make cursor move up/down in rows instead of lines
" stops cursor from skipping lines when wordwrap is turned on 
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set visualbell		" don't beep
set noerrorbells	" don't beep

" don't write backup files
set nobackup
set noswapfile

" highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

nnoremap ; :
nmap <silent> <leader>/ :nohlsearch<CR>

" ------------------------------------------------------------

if has('autocmd')
	autocmd filetype python set expandtab
endif
