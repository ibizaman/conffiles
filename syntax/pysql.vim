if exists("b:current_syntax")
  finish
endif

" Load Python syntax at the top level
runtime! syntax/python.vim

" Needed to make syntax/sql.vim do something
unlet b:current_syntax

" Load SQL syntax
syntax include @SQL syntax/pgsql.vim

syn region pythonTripleString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell

syn region SQLEmbedded contains=@SQL containedin=pythonTripleString contained
    \ start=+\<\C\v(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT|WITH)[ \n]+
    \ end=+;+ 

syn match SQLVariable "%(\zs[a-zA-Z0-9_-]\+\ze)s\?" containedin=SQLEmbedded contained
syn match SQLVariable ":\zs[a-zA-Z0-9_-]\+" containedin=SQLEmbedded contained

hi link SQLVariable Identifier

let b:current_syntax = "pysql"
