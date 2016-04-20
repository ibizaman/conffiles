if exists("b:current_syntax")
  finish
endif

" Load Python syntax at the top level
runtime! syntax/python.vim

" Needed to make syntax/sql.vim do something
unlet b:current_syntax

" Load SQL syntax
syntax include @SQL syntax/sql.vim

" Need to add the keepend here
syn region pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape,@Spell keepend
syn region  pythonRawString matchgroup=pythonQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell keepend

syn region SQLEmbedded contains=@SQL containedin=pythonString,pythonRawString contained
    \ start=+\<\v(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT)[ \n]+
    \ end=+;+ 

syn match SQLVariable "%(\zs[a-zA-Z0-9_-]\+\ze)s\?" containedin=SQLEmbedded contained

hi link SQLVariable Identifier

let b:current_syntax = "pysql"
