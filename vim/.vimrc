let mapleader ="."


"" Plugins
call plug#begin()

" cosmetic
Plug 'itchyny/lightline.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'christianrondeau/vim-base64'

" useful
Plug 'masukomi/vim-markdown-folding'
Plug 'kovetskiy/sxhkd-vim'
Plug 'scrooloose/nerdtree'

call plug#end()


"" color theme
	colorscheme distinguished

""general
	set number	" sets line number
	set linebreak	" Break lines at word (requires Wrap lines)
	set textwidth=100	" Line wrap (number of cols)
	set showmatch	" Highlight matching brace
	set wildmode=longest,list,full
	set nohlsearch	" Highlight all search results
	set ruler	" Show row and column ruler information 
	set undolevels=1000	" Number of undo levels
	syntax on
	filetype plugin on

"" vim lightline fix
	set laststatus=2


"tab binds



"" restarts sxhkd when the config file is saved
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Markdown
	autocmd FileType markdown,rmd,md nnoremap ,o :foldopen<enter>
	autocmd FileType markdown,rmd,md nnoremap ,c :foldclose<enter>
