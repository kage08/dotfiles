set number
set autoindent
set relativenumber
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamed

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'jreybert/vimagit'

Plug 'tc50cal/vim-terminal'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/tagbar' 
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'

Plug 'neoclide/coc.nvim'
Plug 'github/copilot.vim'
Plug 'vim-syntastic/syntastic'

call plug#end()


" Nerdtree commands
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nmap <F8> :TagbarToggle<CR>


colorscheme jellybeans

" Enable folding
set foldmethod=indent
set foldlevel=99

" Pretty python
let python_highlight_all=1
syntax on
