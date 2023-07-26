let g:S = 0  "result in global variable S
function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction
