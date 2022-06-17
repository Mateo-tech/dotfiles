call plug#begin(expand('~/.vim/plugged'))
	Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord

syntax enable
set shiftwidth=4
set tabstop=4
set number

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
