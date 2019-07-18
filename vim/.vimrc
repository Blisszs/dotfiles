let mapleader =","

if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
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
Plug 'vimwiki/vimwiki'

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
	set nocompatible

"" Automaticly closing paranthesis and similar
	autocmd FileType cpp inoremap ( ()<Left>
	autocmd FileType cpp inoremap { {<CR>}<Esc>ko



"" vim lightline fix
	set laststatus=2

"" restarts sxhkd when the config file is saved
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"recognize markdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
