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

" create new item
nnoremap <Leader>i i[ ] 
inoremap <Leader>i [ ] 
" create new item below
nnoremap <Leader>o o[ ] 
inoremap <Leader>o <Esc>o[ ] 
" create new item above
nnoremap <Leader>O O[ ] 
inoremap <Leader>O <Esc>O[ ] 
" mark item under cursor as done
nnoremap <Leader>x :s/^\(\s*\)\[ \]/\1[x]/<CR>
inoremap <Leader>x <Esc>:s/^\(\s*\)\[ \]/\1[x]/<CR>
" mark as undone
nnoremap <Leader>X :s/^\(\s*\)\[x\]/\1[ ]/<CR>
inoremap <Leader>X <Esc>:s/^\(\s*\)\[x\]/\1[ ]/<CR>

" }}}
