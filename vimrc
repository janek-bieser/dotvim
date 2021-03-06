"
" Author : Janek Bieser
"


" Pathogen {{{

" setup pathogen
call pathogen#infect()
call pathogen#helptags()

" END Pathogen }}}

" General {{{

set nocompatible

" set mapleaders
let mapleader = ","
let maplocalleader = "\\"

set encoding=utf-8
set termencoding=utf8

" Enable Mouse
set mouse=a

" Enable syntax highlighting
syntax on

filetype plugin indent on

" wordwrap behavior
set nowrap
set sidescroll=1
set sidescrolloff=1
set textwidth=80

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
set nowritebackup

" auto reload changed files
set autoread

" set working directory
nnoremap <leader>lcd :lcd %:p:h<cr>
nnoremap <leader>cd :cd %:p:h<cr>

" dont show preview buffer on completions
set completeopt=menuone

" END General }}}

" Edit & Navigate Files {{{

inoremap jj <esc>

" toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

" auto center
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" make cursor move up/down in rows instead of lines
" stops cursor from skipping lines when wordwrap is turned on
nnoremap j gj
nnoremap k gk

" move cursor inside quotes/brackes
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i

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

" navigate windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" resize windows
nnoremap <left> <c-w><
nnoremap <right> <c-w>>
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-

" END Windows }}}

" Searching {{{

nnoremap / /\v

set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch  " show search matches as you Type
set hlsearch   " highlight search result

" clear last search term
nnoremap <silent> <leader>/ :let @/=""<cr>

" don't move on * or #
nnoremap * *<c-o>
nnoremap # #<c-o>

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
set relativenumber

function! ToggleAbsoluteLineNumbers()
    if &l:relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

nnoremap <leader>ll :call ToggleAbsoluteLineNumbers()<cr>

" enable status line
set laststatus=2

"
let &colorcolumn="81,".join(range(120,999), ",")

" highlight line the cursor is currently on
set cursorline

if has('gui_running')
    " set font-family and size
    " set guifont=Anonymous\ Pro\ for\ Powerline:h14
    set guifont=Meslo\ LG\ S\ DZ:h12

    set background=light

    " colorscheme
    colorscheme jb-solarized

    " remove scrollbar
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
endif

if !has('gui_running')
    set background=dark
    colorscheme jbdark
endif

" END GUI Settings }}}

" File Specific Settings {{{

if has('autocmd')
    augroup formatting
        au!

        " use word wrap
        au filetype text setlocal wrap nolist lbr nonumber
        au filetype markdown setlocal wrap nolist lbr
        au filetype html,xhtml,xml,xsd setlocal wrap nolist lbr
        au filetype tex setlocal wrap nolist lbr

        au filetype ruby setlocal ts=2 sw=2

        au filetype go setlocal nolist
    augroup END

    augroup autosave
        au!
        au BufLeave,FocusLost * silent! wall
    augroup END
endif

" END File Specific Settings }}}

" Plugins {{{

" UltiSnips {{{

let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" END UltiSnips }}}

" Syntastic {{{

let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ng-", "proprietary attribute \"ui-", "<bc-", "discarding unexpected </bc-"]
let g:syntastic_enable_html_checker=0
let g:syntastic_javascript_checkers=['jsxhint']

" END Syntastic }}}

" CtrlP {{{

let g:ctrlp_map = '<leader>o'
let g:ctrlp_max_height = 15
let g:ctrlp_working_path_mode = 'r0'
noremap <leader>bo :CtrlPBuffer<cr>

" END CtrlP }}}

" YouCompleteMe {{{

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1

" END YouCompleteMe }}}

" Airline {{{

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_theme = 'ubaryd'
"let g:airline_theme = 'wombat'
"let g:airline_theme = 'lucius'
"let g:airline_theme = 'monochrome'

" END Airline }}}

" Go {{{

let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" END Go }}}

" JSX {{{

let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

" END JSX }}}

" END Plugins }}}


" vim: set foldmethod=marker:
