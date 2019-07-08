""general

set relativenumber	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
""  Advanced

set ruler	" Show row and column ruler information 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"" vim lightline fix
set laststatus=2
 
"" Plugins

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'sjl/badwolf'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/Conque-Shell'
Plug 'Valloric/YouCompleteMe'
call plug#end()

"" color theme

colorscheme distinguished
