call plug#begin(expand('~/.vim/plugged'))
	" Nord theme
	Plug 'arcticicestudio/nord-vim'	
	" Auto-completion
"	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" System explorer
	Plug 'preservim/nerdtree'
	" Linting
	" Plug 'dense-analysis/ale'
call plug#end()

colorscheme nord

" Diable compatibility with vi
set nocompatible
" Enable file type detection
filetype on
" Enable plugins and load plugin for the detected file type
filetype plugin on
" Load and indent file for the detected file type
filetype indent on
" Syntax highlighting
syntax on
" Numbered lines
set number
" Indentation settings
set shiftwidth=4
set tabstop=4
" Cursor line highlighting
set cursorline
" Don't wrap lines
set nowrap
" Auto completion 
set wildmenu
" Behave similarly to Bash completion
set wildmode=list:longest
" Ignore for completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe 

" MAPPINGS --------------------------------------------------------------- {{{

inoremap jj <esc>

" NERDTree toggle
nmap <C-f> :NERDTreeToggle<CR>

" NERDTree split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable arrow keys
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
endfor

" }}}

" STATUS BAR ------------------------------------------------------------ {{{

" Clear status bar when vimrc is reloaded.
set statusline=
" Status bar left side.
set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status bar right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
set laststatus=2

" }}}


" " COC.NVIM ------------------------------------------------------------ {{{


" " }}}


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


