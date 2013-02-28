""
"" weLaika VIM Distribution
""

"" General settings
call pathogen#infect()

"" Sane defaults
set encoding=utf-8
let &t_Co=256                     " moar colors
set clipboard=unnamedplus,unnamed " use system clipboard
set nocompatible                  " nocompatible is good for humans
syntax enable                     " enable syntax highlighting...
filetype plugin indent on         " depending on filetypes...
runtime macros/matchit.vim        " with advanced matching capabilities
set pastetoggle=<F12>             " for pasting code into Vim

"" Style
set background=dark
color elflord
set number                        " line numbers are cool
set ruler                         " show the cursor position all the time
set nocursorline                  " disable cursor line
set showcmd                       " display incomplete commands
set novisualbell                  " no flashes please
set scrolloff=3                   " provide some context when editing
set hidden                        " Allow backgrounding buffers without writing them, and
                                  " remember marks/undo for backgrounded buffers
"" Mouse
set mousehide                     " hide mouse when writing
set mouse=a                       " we love the mouse

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set softtabstop=2                 " when deleting, treat spaces as tabs
set expandtab                     " use spaces, not tabs
set list                          " show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set autoindent                    " keep indentation level when no indent is found

"" Wild life
set wildmenu                      " wildmenu gives autocompletion to vim
set wildmode=list:longest,full    " autocompletion shouldn't jump to the first match
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc,*.csv,*.pyc,*.xls

"" List chars
set listchars=""                  " reset the listchars
set listchars=tab:▸\ ,eol:¬       " a tab should display as "▸ ", end of lines as "¬"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " the character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " the character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " unless they contain at least one capital letter

"" Windows
set splitright                    " create new horizontal split on the right
set splitbelow                    " create new vertical split below the current window
set winwidth=84

"" Backup and status line
set backupdir=~/.vim/_backup    " where to put backup files.
set directory=~/.vim/_temp      " where to put swap files.
set laststatus=2

"" FileType settings
if has("autocmd")
  " in Makefiles use real tabs, not tabs expanded to spaces
  augroup filetype_make
    au!
    au FileType make setl ts=8 sts=8 sw=8 noet
  augroup END

  " make sure all markdown files have the correct filetype set and setup wrapping
  augroup filetype_markdown
    au!
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  augroup END

  " treat JSON files like JavaScript
  augroup filetype_json
    au!
    au BufNewFile,BufRead *.json setf javascript
  augroup END

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  augroup filetype_django
    au!
    au FileType python,htmldjango,html setl sts=4 ts=4 sw=4
  augroup END

  " enable <CR> in command line window and quickfix
  augroup enable_cr
    au!
    au CmdwinEnter * nnoremap <buffer> <CR> <CR>
    au BufWinEnter quickfix nnoremap <buffer> <CR> <CR>
  augroup END

  " disable automatic comment insertion
  augroup auto_comments
    au!
    au FileType * setlocal formatoptions-=ro
  augroup END

  " remember last location in file, but not for commit messages,
  " or when the position is invalid or inside an event handler,
  " or when the mark is in the first line, that is the default
  " position when opening a file. See :help last-position-jump
  augroup last_position
    au!
    au BufReadPost *
      \ if &filetype !~ '^git\c' && line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
endif

"" Mappings
let mapleader=','
let localleader='\'

" open vimrc and reload it
nnoremap <Leader>vv :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" disable man page for word under cursor
nnoremap K <Nop>

" y u consistent?
nnoremap Y y$

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" expand %% to current directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :e %%

" easy way to switch between latest files
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>vs :execute "vsplit " . bufname("#")<CR>
nnoremap <Leader>sp :execute "split " . bufname("#")<CR>

" find merge conflict markers
nnoremap <silent> <Leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" toggle list mode
nnoremap <silent> <Leader>l :set nolist!<CR>

" copy current path
nnoremap <silent> <Leader>p :let @* = expand("%")<CR>

" easy substitutions
nnoremap <Leader>r :%s///gc<Left><Left><Left><Left>
nnoremap <Leader>R :%s:::gc<Left><Left><Left><Left>

" remove whitespaces and windows EOL
command! KillWhitespace :normal :%s/\s\+$//e<CR><C-O><CR>
command! KillControlM :normal :%s/<C-V><C-M>//e<CR><C-O><CR>

" easier navigation between split windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

"" Fugitive
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gw  :Gwrite<CR>
nnoremap <Leader>gr  :Gread<CR>

"" Plugins mapping
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>F :CtrlPClearAllCaches\|:CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <S-left> <Esc>:bp<CR>
nnoremap <silent> <S-right> <Esc>:bn<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>u :GundoToggle<CR>

"" Plugins configuration
let g:NERDTreeMouseMode = 3
let g:NERDTreeHighlightCursorline = 0
let g:gundo_right = 1
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
