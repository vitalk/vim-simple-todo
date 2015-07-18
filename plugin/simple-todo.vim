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
nnore <Plug>(simple-todo-new) i[ ]<space>
inore <Plug>(simple-todo-new) [ ]<space>

" Create a new item at the start of this line
inore <Plug>(simple-todo-new-start-of-line) <Esc>mzI<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space><Esc>`z4la
nnore <Plug>(simple-todo-new-start-of-line) mzI<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space><Esc>`z4l
vnore <Plug>(simple-todo-new-start-of-line) I<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space>

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
  nmap <silent><Leader>i <Plug>(simple-todo-new)
  imap <silent><Leader>i <Plug>(simple-todo-new)
  imap <silent><Leader>I <Plug>(simple-todo-new-start-of-line)
  nmap <silent><Leader>I <Plug>(simple-todo-new-start-of-line)
  vmap <silent><Leader>I <Plug>(simple-todo-new-start-of-line)
  nmap <silent><Leader>o <Plug>(simple-todo-below)
  imap <silent><Leader>o <Plug>(simple-todo-below)
  nmap <silent><Leader>O <Plug>(simple-todo-above)
  imap <silent><Leader>O <Plug>(simple-todo-above)
  nmap <silent><Leader>x <Plug>(simple-todo-mark-as-done)
  vmap <silent><Leader>x <Plug>(simple-todo-mark-as-done)
  imap <silent><Leader>x <Plug>(simple-todo-mark-as-done)
  nmap <silent><Leader>X <Plug>(simple-todo-mark-as-undone)
  vmap <silent><Leader>X <Plug>(simple-todo-mark-as-undone)
  imap <silent><Leader>X <Plug>(simple-todo-mark-as-undone)
endif

" }}}
