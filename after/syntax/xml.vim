" Highlight sql snippets in XML, delimited by <sql> tags

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
let b:current_syntax = s:bcs
syntax region sqlSnip matchgroup=Snip start="<sql>" end="</sql>" contains=@SQL
