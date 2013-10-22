if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.as setf actionscript
    au! BufNewFile,BufRead *.md setf markdown
    au! BufNewFile,BufRead *.json setf javascript.json
augroup END
