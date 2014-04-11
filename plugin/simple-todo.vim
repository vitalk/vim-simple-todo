" File:          simple-todo.vim
" Author:        Vital Kudzelka
" Description:   Add some useful mappings to manage simple TODO list
" Version:       0.3


" Guard {{{

if exists('g:loaded_simple_todo') || &cp
  finish
endif
let g:loaded_simple_todo = 1

" }}}
" Mappings {{{

" Create a new item
nnore <Plug>(simple-todo-new) i[ ]<space>
inore <Plug>(simple-todo-new) <Esc>i[ ]<space>

" Create a new item below
nnore <Plug>(simple-todo-below) o[ ]<space>
inore <Plug>(simple-todo-below) <Esc>o[ ]<space>

" Create a new item above
nnore <Plug>(simple-todo-above) O[ ]<space>
inore <Plug>(simple-todo-above) <Esc>O[ ]<space>

" Mark item under cursor as done
nnore <Plug>(simple-todo-mark-as-done) :s/^\(\s*\)\[ \]/\1[x]/<cr>
inore <Plug>(simple-todo-mark-as-done) <Esc>:s/^\(\s*\)\[ \]/\1[x]/<cr>

" Mark as undone
nnore <Plug>(simple-todo-mark-as-undone) :s/^\(\s*\)\[x\]/\1[ ]/<cr>
inore <Plug>(simple-todo-mark-as-undone) <Esc>:s/^\(\s*\)\[x\]/\1[ ]/<cr>

nmap <Leader>i <Plug>(simple-todo-new)
imap <Leader>i <Plug>(simple-todo-new)
nmap <Leader>o <Plug>(simple-todo-below)
imap <Leader>o <Plug>(simple-todo-below)
nmap <Leader>O <Plug>(simple-todo-above)
imap <Leader>O <Plug>(simple-todo-above)
nmap <Leader>x <Plug>(simple-todo-mark-as-done)
imap <Leader>x <Plug>(simple-todo-mark-as-done)
nmap <Leader>X <Plug>(simple-todo-mark-as-undone)
imap <Leader>X <Plug>(simple-todo-mark-as-undone)

" }}}
