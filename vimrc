"==---------------------------------------------=="
"==--------------     .vimrc      --------------=="
"==-------------- by Janek Bieser --------------=="
"==---------------------------------------------=="


set nocompatible

" setup pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" change the mapleader from \ to ,
let mapleader=","


" ----------------------------------------
" Basic Mappings
" ----------------------------------------

nnoremap ; :
inoremap jj <Esc>

" split line at cursor location
nnoremap K <Esc>i<CR><Esc>

" clear last search term
nmap <silent> <leader>/ :let @/=""<CR>

" open/reload .vimrc
map <leader>v :vsp ~/.vim/vimrc<CR><C-W><CR>
map <silent> <leader>V :silent! :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" toggle spelling
nmap <leader>s :setlocal spell!<CR>

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

nmap <leader>w <c-w>

" trigger user completion
imap <c-space> <c-x><c-u><c-p>


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

if has('gui_running')
    set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:.
else
    set listchars=tab:\ \ ,trail:.,extends:>,precedes:<,nbsp:.
endif

" tabstop configuration
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set shiftround " round indent to multiple of 'shiftwidth'

set backspace=indent,eol,start
set showmatch " show matching parenthesis

" searching behavior
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch  " show search matches as you Type
set hlsearch   " highlight search result

" buffer settings
set wildignore=*.swp
set hidden " allows closing buffer without saving

" don't beep
set visualbell
set noerrorbells

" don't write backup files
set nobackup
set noswapfile


" Autocommands ---------------------------------

if has('autocmd')
    augroup formattingEx
        au!

        " use word wrap
        au filetype text setlocal wrap nolist lbr nonumber
        au filetype markdown setlocal wrap nolist lbr
        au filetype html,xhtml,xml,xsd setlocal wrap nolist lbr ts=2 sw=2
    augroup END

    " autosave
    au BufLeave,FocusLost * silent! wall
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

" highlight line the cursor is currently on
set cursorline

if has('gui_running')
    " set font-family and size
    set guifont=Anonymous\ Pro\ for\ Powerline:h14

    " colorscheme
    colorscheme solarized

    " remove scrollbar
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
endif

if !has('gui_running')
    set background=dark
    " solarized options 
    let g:solarized_termcolors = 16
    colorscheme solarized

    " Fix comment issue until I know
    " how to really fix it
    exe ":hi Comment cterm=none"
    exe ":hi vimLineComment cterm=none"
endif


" ----------------------------------------
" UltiSnips Plug-in settings
" ----------------------------------------

let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ----------------------------------------
" Command-T Plug-in settings
" ----------------------------------------

let g:CommandTMaxHeight=30

" ----------------------------------------
" Clang Complete Plug-in settings
" ----------------------------------------

let g:clang_auto_select = 1
let g:clang_snippets = 1
let g:clang_close_preview = 1
let g:clang_complete_copen = 1
let g:clang_snippets_engine = 'ultisnips'

nmap <leader>f :exe g:ClangUpdateQuickFix()<CR>


" ----------------------------------------
" LustJuggler Plug-in settings
" ----------------------------------------

nmap <leader>jb :LustyJuggler<CR>


" ----------------------------------------
" eclim Plug-in settings
" ----------------------------------------

let g:acp_behaviorJavaEclimLength=3
let g:EclimJavaCompleteCaseSensitive=0


" ----------------------------------------
" Powerline Plug-in settings
" ----------------------------------------

set rtp+=/usr/local/powerline/powerline/bindings/vim
