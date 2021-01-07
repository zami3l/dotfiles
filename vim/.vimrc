" ### Default ###
" view line number
:set number 
":set relativenumber

" ### Tabulation ###
" The width of a TAB is set to 4.
" Still it is a \t. It is just that Vim will interpret it to be having a width of 4.
set tabstop=4
" Indents will have a width of 4
set shiftwidth=4
" Sets the number of columns for a TAB
set softtabstop=4
" Expand TABs to spaces
set expandtab

" ### Vim-Plug ###
call plug#begin()

" Nerdtree
Plug 'preservim/nerdtree'

" Fzf
Plug 'junegunn/fzf.vim'

" Lightline
Plug 'itchyny/lightline.vim'

" Vim fugitive
Plug 'tpope/vim-fugitive'

" Surround
Plug 'tpope/vim-surround'

" Tab
Plug 'godlygeek/tabular'

" Tmux
Plug 'tmux-plugins/vim-tmux'

call plug#end()

" ### Configuration lightline ###
set laststatus=2
set noshowmode
