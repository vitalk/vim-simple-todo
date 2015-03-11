# Simple TODO in Vim

May be this is the smallest Vim plugin in the world. It adds some useful
mappings for manage simple TODO lists (example below) and nothing more.

```
[x] Create plugin
[x] Add help documentation
[x] Publish to GitHub
[ ] Spread the word
```

Plugin supports [GitHub-like task lists](https://github.com/blog/1375-task-lists-in-gfm-issues-pulls-comments) as well.

- [x] Support markdown list markers
+ [x] So it's easy to create tasks in issues or pull requests on GitHub

## Installation

Use your favorite installation method, but I recommend to use
[pathogen](https://github.com/tpope/vim-pathogen) and run:

```sh
cd .vim/bundle
git clone https://github.com/vitalk/vim-simple-todo
```

## Usage

All this mappings use the `<leader>` key and they work the same on `NORMAL`
and `INSERT` modes. I prefer to use the comma as the `<leader>` key but fell
free to set your own.

| Key | Help                                 |
|:---:|:-------------------------------------|
| ,i  | Create a new todo under cursor       |
| ,o  | Create a new todo below current line |
| ,O  | Create a new todo above current line |
| ,x  | Mark todo under cursor as done       |
| ,X  | Mark todo as undone                  |

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

## Issues

Don't hesitate to open [GitHub Issues](https://github.com/vitalk/vim-simple-todo/issues) for any bug or suggestions.

## Copyright

Copyright © 2012 Vital Kudzelka. Use it for Good not Evil.

Distributed under the [MIT license](http://mit-license.org/vitalk).
