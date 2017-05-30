# Simple todo in Vim

Maybe this is the smallest Vim plugin in the world. It adds some useful
mappings for manage simple todo lists (example below) and nothing more.

```
[x] Create plugin
[x] Add helpful documentation
[x] Publish to GitHub
[ ] Spread the word
```

## Features

- Support [GitHub-like task lists](https://github.com/blog/1375-task-lists-in-gfm-issues-pulls-comments):

  - [x] Works well with different markdown list markers, e.g. `-`, `+`, `*`.
  + [ ] So it’s easy to create tasks in issues or pull requests on GitHub

- Visually selected tasks can be processed at once.

- Each mapping is repeatable via <kbd>.</kbd> (require [tpope/repeat](https://github.com/tpope/vim-repeat)).

- Tick symbol is configurable, e.g.

  ```
  [y] Water
  [y] Bread
  [ ] Milk
  ```

## Installation

Use your favorite installation method:

- Tim Pope’s [pathogen](https://github.com/tpope/vim-pathogen):

  ```sh
  cd ~/.vim/bundle
  git clone https://github.com/vitalk/vim-simple-todo
  ```

- Junegunn Choi’s [Plug](https://github.com/junegunn/vim-plug) (recommend):

  ```vim
  Plug 'vitalk/vim-simple-todo'
  ```

  ```sh
  vim +PlugInstall +qall
  ```

## Usage

All this mappings use the `<leader>` key and they work the same on `NORMAL`,
`VISUAL` and `INSERT` modes. The default `<leader>` is backslash (`\`), but I prefer to use the comma
as the `<leader>` key but [feel free to set your own](https://github.com/vitalk/sanevi/blob/master/plugin/00_essential.vim#L38-L39).

| Key           | Help                                   |
|:--------------|:---------------------------------------|
| <kbd>`<leader>`i</kbd> | Create a new todo under cursor         |
| <kbd>`<leader>`I</kbd> | Create a new todo for current line     |
| <kbd>`<leader>`o</kbd> | Create a new todo below current line   |
| <kbd>`<leader>`O</kbd> | Create a new todo above current line   |
| <kbd>`<leader>`x</kbd> | Mark todo under cursor as done         |
| <kbd>`<leader>`X</kbd> | Mark todo as undone                    |
| <kbd>`<leader>`s</kbd> | Switch todo status for current line    |

Or even remap them to somethings more comfortable for you:

```vim
# Disable default key bindings
let g:simple_todo_map_keys = 0

# Map your keys
nmap <c-i> <Plug>(simple-todo-new)
imap <c-i> <Plug>(simple-todo-new)
# ...etc.
```

See `:help simple-todo-maps` for list of available <Plug> mappings.

You can also change the tick symbol to something else. Default is `x`.

```vim
let g:simple_todo_tick_symbol = 'y'
```

## Issues

Don’t hesitate to open [GitHub Issues](https://github.com/vitalk/vim-simple-todo/issues) for any bug or suggestions.

## Copyright

Copyright © 2012 Vital Kudzelka. Use it for Good not Evil.

Distributed under the [MIT license](http://mit-license.org/vitalk).
