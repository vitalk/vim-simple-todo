" File:          simple-todo.vim
" Author:        Vital Kudzelka
" Description:   Add some useful mappings to manage simple TODO list
" Version:       0.2
" Last Modified: December 04, 2012


" Guard {{{

if exists('g:loaded_simple_todo') || &cp
  finish
endif
let g:loaded_simple_todo = 1

" }}}
" Mappings {{{

" create new item
nnoremap <Leader>i i[ ] 
imap <Leader>i [ ] 
" create new item below
nnoremap <Leader>o o[ ] 
imap <Leader>o <Esc>,o
" create new item above
nnoremap <Leader>O O[ ] 
imap <Leader>O <Esc>,O
" mark item under cursor as done
nnoremap <Leader>x :s/^\(\s*\)\[ \]/\1[x]/<CR>
imap <Leader>x <Esc>,x
" mark as undone
nnoremap <Leader>X :s/^\(\s*\)\[x\]/\1[ ]/<CR>
imap <Leader>X <Esc>,X

" }}}
