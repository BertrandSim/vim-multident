" This plugin expands the < and > operators with a count, 
" to indent/dedent lines multiple times.

" TODO: s:, SID
" TODO: custom maps
" TODO: option to omap last char = line  (eg. ghh, gll = gh_, gl_)

" Second ver : 2019-08-02
" usage: like an operator in normal mode: 
" [count1][< or >][count2]<motion> 
" This indents/dedents [count2]<motion> lines [count1] times!

function! Indent_multi(type)
  let startl = line("'[")
  let endl = line("']")
  exec startl.','.endl . repeat(">", s:count)
endfunction

function! Dedent_multi(type)
  let startl = line("'[")
  let endl = line("']")
  exec startl.','.endl . repeat("<", s:count)
endfunction
" v:count multiplies both counts together, 
" we need another variable -> s:count
function! Set_multi_count(n)
  let s:count=a:n
endfunction

nnoremap <silent> <Plug>(dedent_mult) :<C-u>call Set_multi_count(v:count1) \| set opfunc=Dedent_multi<CR>g@
nnoremap <silent> <Plug>(indent_mult) :<C-u>call Set_multi_count(v:count1) \| set opfunc=Indent_multi<CR>g@

nmap < <Plug>(dedent_mult)
nmap > <Plug>(indent_mult)
" nmap gh <Plug>(dedent_mult)
" nmap gl <Plug>(indent_mult)
onoremap <expr> < v:operator ==# 'g@' && &opfunc ==# 'Dedent_multi' ? '_' : '<'
onoremap <expr> > v:operator ==# 'g@' && &opfunc ==# 'Indent_multi' ? '_' : '>'


"""

" " first ver, visual mode
" " """"""""""""""""""""""
" " usage: v<move around><count><map>
" " works! but already works for visual mode in stock vim (see :h v_>)
" 
" function! Indent_multi()
"   let startl = line("'<")
"   let endl = line("'>")
"   exec startl.','.endl . repeat(">", v:count1)
" endfunction
" 
" function! Dedent_multi()
"   let startl = line("'<")
"   let endl = line("'>")
"   exec startl.','.endl . repeat("<", v:count1)
" endfunction
" 
" " vmap < <Plug>(dedentmult)
" vmap <leader>h <Plug>(dedentmult)
" vmap <leader>l <Plug>(indentmult)
" vnoremap <Plug>(dedentmult) :<C-u>call Dedent_multi()<CR>
" vnoremap <Plug>(indentmult) :<C-u>call Indent_multi()<CR>
" 
" """
