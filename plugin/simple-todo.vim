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

" Do enable normal mode keys? (yes)
if !exists('g:simple_todo_map_normal_mode_keys')
  let g:simple_todo_map_normal_mode_keys = 1
endif

" Do enable insert mode keys? (yes)
if !exists('g:simple_todo_map_insert_mode_keys')
  let g:simple_todo_map_insert_mode_keys = 1
endif

" Do enable visual mode keys? (yes)
if !exists('g:simple_todo_map_visual_mode_keys')
  let g:simple_todo_map_visual_mode_keys = 1
endif

if !exists('g:simple_todo_tick_symbol')
    let g:simple_todo_tick_symbol = 'x'
endif

if !exists('g:simple_todo_list_symbol')
    let g:simple_todo_list_symbol = '-'
endif

" }}}
" Private functions {{{

fu! s:get_list_marker(linenr) " {{{
  return substitute(getline(a:linenr), '^\s*\([-+*]\?\s*\).*', '\1', '')
endfu " }}}

fu! s:go(type, ...) abort " {{{
  if a:0
    let [lnum1, lnum2] = [a:1, a:2]
  else
    let [lnum1, lnum2] = [line("'["), line("']")]
  endif

  let s:mark_todo = '\1[ ]'
  let s:mark_done = '\1[' . g:simple_todo_tick_symbol . ']'
  let s:pat_mark_todo = '^\(\s*[-+*]\?\s*\)\[ \]'
  let s:pat_mark_done = '^\(\s*[-+*]\?\s*\)\[' . g:simple_todo_tick_symbol . ']'
  for lnum in range(lnum1, lnum2)
    let line = getline(lnum)
    if strlen(line) > 0
      if a:type == 0 " add [ ]
        if line !~ s:pat_mark_todo && line !~ s:pat_mark_done
          let line = substitute(line, '^\(\s*\)', s:mark_todo . ' ', '')
        endif
      elseif a:type == 1 " mark done
        if line =~ s:pat_mark_todo
          let line = substitute(line, s:pat_mark_todo, s:mark_done, '')
        endif
      elseif a:type == 2 " mark undone
        if line =~ s:pat_mark_done
          let line = substitute(line, s:pat_mark_done, s:mark_todo, '')
        endif
      elseif a:type == 3 " switch mark
        if line =~ s:pat_mark_todo
          let line = substitute(line, s:pat_mark_todo, s:mark_done, '')
        elseif line =~ s:pat_mark_done
          let line = substitute(line, s:pat_mark_done, s:mark_todo, '')
        endif
      endif
      call setline(lnum, line)
    end
  endfor
endfu " }}}

" }}}
" Public API {{{

" Create a new item
nnore <silent> <Plug>(simple-todo-new) i[ ]<space>
inore <silent> <Plug>(simple-todo-new) [ ]<space>

" Create a new item with some list prefix symbol
nnore <silent> <Plug>(simple-todo-new-list-item) "=g:simple_todo_list_symbol.' [ ] '<cr>pa
inore <silent> <Plug>(simple-todo-new-list-item) <Esc>"=g:simple_todo_list_symbol.' [ ] '<cr>pa

" Create a new item at the start of this line
inore <silent> <Plug>(simple-todo-new-start-of-line) <Esc>mzI<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space><Esc>`z4la
nnore <silent> <Plug>(simple-todo-new-start-of-line) mzI<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space><Esc>`z4l
vnore <silent> <Plug>(simple-todo-new-start-of-line) I<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space>

" Create a new item below
nnore <silent> <Plug>(simple-todo-below) o<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space>
inore <silent> <Plug>(simple-todo-below) <Esc>o<c-r>=<SID>get_list_marker(line('.')-1)<cr>[ ]<space>

" Create a new item above
nnore <silent> <Plug>(simple-todo-above) O<c-r>=<SID>get_list_marker(line('.')+1)<cr>[ ]<space>
inore <silent> <Plug>(simple-todo-above) <Esc>O<c-r>=<SID>get_list_marker(line('.')+1)<cr>[ ]<space>

" Mark item under cursor as done
nnore <silent> <Plug>(simple-todo-mark-as-done) :execute 's/^\(\s*[-+*]\?\s*\)\[ \]/\1[' . g:simple_todo_tick_symbol . ']/'<cr>
      \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-done)")<cr>
vnore <silent> <Plug>(simple-todo-mark-as-done) :execute 's/^\(\s*[-+*]\?\s*\)\[ \]/\1[' . g:simple_todo_tick_symbol . ']/'<cr>
      \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-done)")<cr>
inore <silent> <Plug>(simple-todo-mark-as-done) <Esc>:execute 's/^\(\s*[-+*]\?\s*\)\[ \]/\1[' . g:simple_todo_tick_symbol . ']/'<cr>
      \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-done)")<cr>

" Mark as undone
nnore <silent> <Plug>(simple-todo-mark-as-undone) :execute 's/^\(\s*[-+*]\?\s*\)\[' . g:simple_todo_tick_symbol . ']/\1[ ]/'<cr>
      \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-undone)")<cr>
vnore <silent> <Plug>(simple-todo-mark-as-undone) :execute 's/^\(\s*[-+*]\?\s*\)\[' . g:simple_todo_tick_symbol . ']/\1[ ]/'<cr>
      \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-undone)")<cr>
inore <silent> <Plug>(simple-todo-mark-as-undone) <Esc>:execute 's/^\(\s*[-+*]\?\s*\)\[' . g:simple_todo_tick_symbol . ']/\1[ ]/'<cr>
      \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-undone)")<cr>

" Switch marks for visual selected lines
nnoremap <silent> <Plug>(simple-todo-mark-switch)           :<C-U>call <SID>go(3, line("."), line("."))<cr>
        \:silent! call repeat#set("\<Plug>(simple-todo-mark-switch)")<cr>
inoremap <silent> <Plug>(simple-todo-mark-switch)           <Esc>:<C-U>call <SID>go(3, line("."), line("."))<cr>
        \:silent! call repeat#set("\<Plug>(simple-todo-mark-switch)")<cr>
xnoremap <silent> <Plug>(simple-todo-mark-switch)           :<C-U>call <SID>go(3, line("'<"), line("'>"))<cr>
        \:silent! call repeat#set("\<Plug>(simple-todo-mark-switch)")<cr>

" Handle marks for visual selected lines
xnoremap <silent> <Plug>(simple-todo-new-start-of-line)     :<C-U>call <SID>go(0, line("'<"), line("'>"))<cr>
        \:silent! call repeat#set("\<Plug>(simple-todo-new-start-of-line)")<cr>
xnoremap <silent> <Plug>(simple-todo-mark-as-done)          :<C-U>call <SID>go(1, line("'<"), line("'>"))<cr>
        \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-done)")<cr>
xnoremap <silent> <Plug>(simple-todo-mark-as-undone)        :<C-U>call <SID>go(2, line("'<"), line("'>"))<cr>
        \:silent! call repeat#set("\<Plug>(simple-todo-mark-as-undone)")<cr>

" }}}
" Key bindings {{{

if g:simple_todo_map_keys
  if g:simple_todo_map_normal_mode_keys
    nmap <Leader>i <Plug>(simple-todo-new)
    nmap <Leader>I <Plug>(simple-todo-new-start-of-line)
    nmap <Leader>o <Plug>(simple-todo-below)
    nmap <Leader>O <Plug>(simple-todo-above)
    nmap <Leader>x <Plug>(simple-todo-mark-as-done)
    nmap <Leader>X <Plug>(simple-todo-mark-as-undone)
    nmap <Leader>s <Plug>(simple-todo-mark-switch)
  endif

  if g:simple_todo_map_insert_mode_keys
    imap <Leader>i <Plug>(simple-todo-new)
    imap <Leader>I <Plug>(simple-todo-new-start-of-line)
    imap <Leader>o <Plug>(simple-todo-below)
    imap <Leader>O <Plug>(simple-todo-above)
    imap <Leader>X <Plug>(simple-todo-mark-as-undone)
    imap <Leader>x <Plug>(simple-todo-mark-as-done)
    imap <Leader>s <Plug>(simple-todo-mark-switch)
  endif

  if g:simple_todo_map_visual_mode_keys
    vmap <Leader>I <Plug>(simple-todo-new-start-of-line)
    vmap <Leader>X <Plug>(simple-todo-mark-as-undone)
    vmap <Leader>x <Plug>(simple-todo-mark-as-done)
    vmap <Leader>s <Plug>(simple-todo-mark-switch)
  endif
endif

" }}}
