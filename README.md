vimfiles
========

weLaika Vim distribution: Keep It Simple Stupid.

## Installation:

Prerequisites: ruby, git.

1. Move your existing configuration somewhere else:
   `cd && mkdir vim_backup && mv ~/.vim* vim_backup`
2. Clone this repo into ".vim":
   `git clone https://github.com/welaika/vimfiles ~/.vim`
3. Go into ".vim" and run "rake":
   `cd ~/.vim && rake`

This will install "~/.vimrc" symlink that point to
the config inside the ".vim" directory.

## Features:

* General:
  - use pathogen as plugin environment
  - sane defaults: nocompatible mode, utf8, advanced syntax highlighting
* User Interface:
  - incremental, case-insensitive search
  - wildmenu goodies
  - mouse enabled
* Spacing:
  - 2 spaces, no tabs, uses bash-alike autocompletion for files and directories
  - tabs are displayed as `▸ `, end of lines as `¬`, trailing spaces as `.`
* Conventions:
  - follow style conventions for ruby, python and makefiles
  - reopen files in the same spot where you closed them
  - 'Leader' character mapped to "," (comma)
* Mappings:
  - pressing enter in normal mode resets search highlighting
  - %% is expanded to the current directory in command mode
  - `,e` edits a file in the same directory of the current
  - `,f` opens file search via CtrlP plugin
  - `,b` opens buffer search via CtrlP plugin
  - `,,` switches between two last buffers
  - `,cf` jumps to the first conflict marker
  - `,l` toggles list mode
  - `,p` copies the path of the current file
  - `:KillWhitespace` removes all trailing spaces
  - `<C-j/k/h/l>` switches between windows (no need to prepend `<C-w>`)

## Plugins:

* ctrlp.vim
* gundo.vim
* nerdtree
* supertab
* vim-coffee-script
* vim-commentary
* vim-fugitive
* vim-haml
* vim-javascript
* vim-repeat
* vim-surround
