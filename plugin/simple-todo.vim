" File:          simple-todo.vim
" Author:        Vital Kudzelka
" Description:   Add some useful mappings to manage simple TODO list
" Version:       0.1
" Last Modified: Nov 25, 2012


" Guard {{{
if exists('g:loaded_simple_todo') || &cp
  finish
endif
let g:loaded_simple_todo = 1
" }}}
" Mappings {{{
" create new item
map ,i i[ ] 
imap ,i [ ] 
" create new item below
map ,o o[ ] 
imap ,o <Esc>,o
" create new item above
map ,O O[ ] 
imap ,O <Esc>,O
" mark item under cursor as done
map ,x :s/^\(\s*\)\[ \]/\1[x]/<CR>
imap ,x <Esc>,x
" mark as undone
map ,X :s/^\(\s*\)\[x\]/\1[ ]/<CR>
imap ,X <Esc>,X
" }}}
