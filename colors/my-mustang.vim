highlight clear
if exists("syntax_on")
    syntax reset
end

runtime colors/mustang.vim

let g:colors_name = "my-mustang"

highlight Folded ctermfg=235 ctermbg=233
highlight FoldColumn ctermfg=235 ctermbg=233

highlight clear DiffAdd 
highlight clear DiffChange 
highlight clear DiffDelete 
highlight clear DiffText 
highlight clear Search 

highlight DiffAdd ctermbg=232
highlight DiffChange ctermbg=232
highlight DiffDelete ctermbg=52 ctermfg=88
highlight DiffText ctermbg=88
highlight Search ctermbg=4
