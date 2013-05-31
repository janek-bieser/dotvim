"
" Author : Janek Bieser
"


" Pathogen {{{

" setup pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" END Pathogen }}}

" General {{{

set nocompatible

" set mapleaders
let mapleader = ","
let maplocalleader = "\\"

set encoding=utf-8

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
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set shiftround " round indent to multiple of 'shiftwidth'

set backspace=indent,eol,start
set showmatch " show matching parenthesis

" buffer settings
set wildignore=*.swp
set hidden " allows closing buffer without saving

" don't beep
set visualbell
set noerrorbells

" don't write backup files
set nobackup
set noswapfile

" set working directory
nnoremap <leader>lcd :lcd %:p:h<cr>
nnoremap <leader>cd :cd %:p:h<cr>

" END General }}}

" Edit & Navigate Files {{{

inoremap jj <esc>

" auto center
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" let up down arrow move lines
nnoremap <up> ddkP
nnoremap <down> ddp

" make cursor move up/down in rows instead of lines
" stops cursor from skipping lines when wordwrap is turned on
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" move cursor inside quotes/brackes
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i

" insert blank line above/below
nnoremap gO O<esc>j
nnoremap g<c-o> o<esc>k

" split line at cursor location
nnoremap K <esc>i<cr><esc>

" trigger user completion
inoremap <c-space> <c-x><c-u><c-p>

" save file
inoremap <c-s> <esc>:w<cr>a
nnoremap <c-s> :w<cr>

" make current word uppercase
nnoremap <c-u> viwUe
inoremap <c-u> <esc>viwUea

" toggle spelling
nnoremap <leader>s :setlocal spell!<cr>

" END Edit & Navigate Files }}}

" Windows {{{

" window mappings
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" END Windows }}}

" Searching {{{

nnoremap / /\v

" searching behavior
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch  " show search matches as you Type
set hlsearch   " highlight search result

" clear last search term
nnoremap <silent> <leader>/ :let @/=""<cr>

" don't move on *
nnoremap * *<c-o>

" END Searching }}}
 
" Copy & Paste {{{

" copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p

" END Copy & Paste }}}

" Quick Edit and Source Files {{{

nnoremap <leader>ev :vsp ~/.vim/vimrc<cr><c-w><cr>
nnoremap <leader>ez :vsp ~/.zshrc<cr><c-w><cr>
nnoremap <leader>et :vsp ~/.tmux.conf<cr><c-w><cr>

" reload vimrc
nnoremap <silent> <leader>V :silent! :source ~/.vimrc<cr>:filetype detect<cr>:exe ":echo 'vimrc reloaded'"<cr>

" source/execute current line
nnoremap <leader>S :exe getline('.')<cr>

" END Quick Edit Files }}}

" GUI Settings {{{

" command line
set cmdheight=1
set wildmenu
set showcmd

" show line numbers
set number

" enable status line
set laststatus=2

" highlight line the cursor is currently on
set cursorline

set background=dark

if has('gui_running')
    " set font-family and size
    set guifont=Anonymous\ Pro\ for\ Powerline:h14

    " colorscheme
    colorscheme jb-solarized

    " remove scrollbar
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
endif

if !has('gui_running')
    " solarized options 
    let g:solarized_termcolors = 16
    colorscheme jb-solarized

    " Fix comment issue until I know
    " how to really fix it
    exe ":hi Comment cterm=none"
    exe ":hi vimLineComment cterm=none"
endif

" END GUI Settings }}}

" File Specific Settings {{{

if has('autocmd')
    augroup formattingEx
        au!

        " use word wrap
        au filetype text setlocal wrap nolist lbr nonumber
        au filetype markdown setlocal wrap nolist lbr
        au filetype html,xhtml,xml,xsd setlocal wrap nolist lbr ts=2 sw=2
        au filetype tex setlocal wrap nolist lbr

        au filetype ruby setlocal ts=2 sw=2
    augroup END

    " autosave
    au BufLeave,FocusLost * silent! wall
endif

" END File Specific Settings }}}

" Plugins {{{

" UltiSnips {{{

let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" END UltiSnips }}}

" CtrlP {{{

let g:ctrlp_map = '<leader>o'
let g:ctrlp_max_height = 15
let g:ctrlp_working_path_mode = 'r0'
noremap <leader>bo :CtrlPBuffer<cr>

" END CtrlP }}}

" Clang Complete {{{

let g:clang_auto_select = 1
let g:clang_snippets = 1
let g:clang_close_preview = 1
let g:clang_complete_copen = 1
let g:clang_snippets_engine = 'ultisnips'

nnoremap <leader>f :exe g:ClangUpdateQuickFix()<cr>

" END Clang Complete }}}

" eclim {{{

set cot-=preview
let g:acp_behaviorJavaEclimLength = 3
let g:EclimJavaCompleteCaseSensitive = 0

" mappings
nnoremap <leader>ji :JavaImport<cr>
nnoremap <leader>jc :JavaCorrect<cr>

" END eclim }}}

" Powerline {{{

let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'long'
let g:Powerline_colorscheme = 'solarized16'
let g:Powerline_symbols_override = { 'BRANCH': [0x2213], 'LINE': 'L', 'RO': '-', 'FT': 'ft' }
let g:Powerline_dividers_override = [']>', '>', '<[', '<']

" END Powerline }}}

" END Plugins }}}

" vim: set foldmethod=marker:
