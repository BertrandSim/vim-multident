" This plugin expands the < and > operators with a count, 
" to indent/dedent lines multiple times.

" (done): s:, SID
" TODO: custom maps
" TODO: option to omap last char = line  (eg. ghh, gll = gh_, gl_)


" main {{{

" usage: like an operator in normal mode: 
" [count1][< or >][count2]<motion> 
" This indents/dedents the lines given by [count2]<motion>, [count1] times!

function! s:Indent_multi(type)
  let startl = line("'[")
  let endl = line("']")
  exec startl.','.endl . repeat(">", s:count)
endfunction

function! s:Dedent_multi(type)
  let startl = line("'[")
  let endl = line("']")
  exec startl.','.endl . repeat("<", s:count)
endfunction
" v:count multiplies both counts together, 
" we need another variable -> s:count
function! s:Set_multi_count(n)
  let s:count=a:n
endfunction


nnoremap <silent> <Plug>(dedent_mult)
      \ :<C-u>call <SID>Set_multi_count(v:count1) \|
      \ set opfunc=<SID>Dedent_multi<CR>g@

nnoremap <silent> <Plug>(indent_mult)
      \ :<C-u>call <SID>Set_multi_count(v:count1) \|
      \ set opfunc=<SID>Indent_multi<CR>g@

nmap < <Plug>(dedent_mult)
nmap > <Plug>(indent_mult)
" nmap gh <Plug>(dedent_mult)
" nmap gl <Plug>(indent_mult)


" }}}
" omap last char (double key) {{{

function! s:Indent_omap_line(char)
  if v:operator ==# 'g@' &&  ( &g:opfunc == '<SNR>'.s:SID()."_"."Indent_multi" )
    return '_'
  else
    return a:char
  endif
endfunction

function! s:Dedent_omap_line(char)
  if v:operator ==# 'g@' &&  ( &g:opfunc == '<SNR>'.s:SID()."_"."Dedent_multi" )
    return '_'
  else
    return a:char
  endif
endfunction

onoremap <expr> < <SID>Dedent_omap_line('<')
onoremap <expr> > <SID>Indent_omap_line('>')
" onoremap <expr> < v:operator ==# 'g@' && &opfunc ==# '<SID>Dedent_multi' ? '_' : '<'
" onoremap <expr> > v:operator ==# 'g@' && &opfunc ==# '<SID>Indent_multi' ? '_' : '>'


" }}}
" helper funcs {{{

function s:SID()
  " get SID of script
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction


" }}}


" vim: set fdm=marker:
