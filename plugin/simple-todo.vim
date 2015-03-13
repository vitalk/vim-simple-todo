" File:          simple-todo.vim
" Author:        Vital Kudzelka
" Description:   Add some useful mappings to manage simple TODO list


" Guard {{{

if exists('g:loaded_simple_todo') || &cp
  finish
endif
let g:loaded_simple_todo = 1

" }}}
" Config options {{{

" Do map key bindings? (yes)
if !exists('g:simple_todo_map_keys')
  let g:simple_todo_map_keys = 1
endif

" }}}
" Private functions {{{

fu! s:get_list_marker(linenr) " {{{
  return substitute(getline(a:linenr), '^\s*\([-+*]\?\s*\).*', '\1', '')
endfu " }}}

" }}}
" Public API {{{

" Create a new item
nnore <Plug>(simple-todo-new) a[ ]<space>
inore <Plug>(simple-todo-new) [ ]<space>

" Create a new item below
nnore <Plug>(simple-todo-below) o<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space>
inore <Plug>(simple-todo-below) <Esc>o<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space>

" Create a new item above
nnore <Plug>(simple-todo-above) O<c-r>=<SID>get_list_marker(line('.')+1)<cr>[ ]<space>
inore <Plug>(simple-todo-above) <Esc>O<c-r>=<SID>get_list_marker(line('.')+1)<cr>[ ]<space>

" Mark item under cursor as done
nnore <Plug>(simple-todo-mark-as-done) :s/^\(\s*[-+*]\?\s*\)\[ \]/\1[x]/<cr>
vnore <Plug>(simple-todo-mark-as-done) :s/^\(\s*[-+*]\?\s*\)\[ \]/\1[x]/<cr>
inore <Plug>(simple-todo-mark-as-done) <Esc>:s/^\(\s*[-+*]\?\s*\)\[ \]/\1[x]/<cr>

" Mark as undone
nnore <Plug>(simple-todo-mark-as-undone) :s/^\(\s*[-+*]\?\s*\)\[x\]/\1[ ]/<cr>
vnore <Plug>(simple-todo-mark-as-undone) :s/^\(\s*[-+*]\?\s*\)\[x\]/\1[ ]/<cr>
inore <Plug>(simple-todo-mark-as-undone) <Esc>:s/^\(\s*[-+*]\?\s*\)\[x\]/\1[ ]/<cr>

" }}}
" Key bindings {{{

if g:simple_todo_map_keys
  nmap <Leader>i <Plug>(simple-todo-new)
  imap <Leader>i <Plug>(simple-todo-new)
  nmap <Leader>o <Plug>(simple-todo-below)
  imap <Leader>o <Plug>(simple-todo-below)
  nmap <Leader>O <Plug>(simple-todo-above)
  imap <Leader>O <Plug>(simple-todo-above)
  nmap <Leader>x <Plug>(simple-todo-mark-as-done)
  vmap <Leader>x <Plug>(simple-todo-mark-as-done)
  imap <Leader>x <Plug>(simple-todo-mark-as-done)
  nmap <Leader>X <Plug>(simple-todo-mark-as-undone)
  vmap <Leader>X <Plug>(simple-todo-mark-as-undone)
  imap <Leader>X <Plug>(simple-todo-mark-as-undone)
endif

" }}}
