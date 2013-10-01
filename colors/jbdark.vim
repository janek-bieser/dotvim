set background=dark

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "jbdark"

let s:black_n   =  0
let s:black_b   =  8
let s:red_n     =  1
let s:red_b     =  9
let s:green_n   =  2
let s:green_b   = 10
let s:yellow_n  =  3
let s:yellow_b  = 11
let s:blue_n    =  4
let s:blue_b    = 12
let s:magenta_n =  5
let s:magenta_b = 13
let s:cyan_n    =  6
let s:cyan_b    = 14
let s:white_n   =  7
let s:white_b   = 15

" TODO to stuff


" ------------------------------------------------------------------
" General
" ------------------------------------------------------------------

exe "hi Statement ctermfg=" . s:yellow_b . " ctermbg=none cterm=none"
exe "hi Comment  ctermfg=" . s:black_b   . " ctermbg=none cterm=italic"
exe "hi Function ctermfg=" . s:blue_n   . " ctermbg=none cterm=none"
exe "hi Todo ctermfg=" . s:red_n . " ctermbg=none cterm=underline"
exe "hi PreProc ctermfg=" . s:yellow_n . " ctermbg=none cterm=none"

exe "hi Type ctermfg=" . s:cyan_n . " ctermbg=none cterm=none"
exe "hi String ctermfg=" . s:green_n   . " ctermbg=none cterm=none"
exe "hi Number ctermfg=" . s:magenta_b   . " ctermbg=none cterm=none"
exe "hi Boolean ctermfg=" . s:magenta_n   . " ctermbg=none cterm=none"
exe "hi Special ctermfg=" . s:magenta_n   . " ctermbg=none cterm=none"

exe "hi Folded ctermfg=" . s:blue_n   . " ctermbg=" . "none" . " cterm=none"
exe "hi SpecialKey ctermfg=" . s:black_b . " ctermbg=none cterm=none"


" ------------------------------------------------------------------
" GUI
" ------------------------------------------------------------------

exe "hi LineNr  ctermfg=" . s:black_b . " ctermbg=none cterm=none"
exe "hi CursorLineNr  ctermfg=" . s:black_b . " ctermbg=none cterm=none"
exe "hi CursorLine  ctermfg=none ctermbg=" . s:black_n . " cterm=none"
exe "hi VertSplit ctermfg=" . s:black_b . " ctermbg=" . "none" . " cterm=none"
exe "hi SignColumn ctermfg=none ctermbg=none cterm=none"
exe "hi Directory  ctermfg=" . s:cyan_b . " ctermbg=none cterm=none"


" ------------------------------------------------------------------
" JavaScript
" ------------------------------------------------------------------

exe "hi javaScriptValue ctermfg=" . s:magenta_b   . " ctermbg=none cterm=none"

