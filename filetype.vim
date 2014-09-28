if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au! BufNewFile,BufRead *.as setf actionscript
    au! BufNewFile,BufRead *.md setf markdown
    au! BufNewFile,BufRead *.json setf javascript.json
    au! BufNewFile,BufRead *.gradle setf groovy
    au! BufNewFile,BufRead *.story setf gherkin
    au! BufNewFile,BufRead *.hbs,*.handlebars setf html
    au! BufNewFile,BufRead *.creole,*.wiki setf creole
augroup END

augroup syntaxdetect
    au! Syntax gherkin source ~/.vim/syntax/cucumber.vim
augroup END
