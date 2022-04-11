"__     _____ __  __ ____   ____ 
"\ \   / /_ _|  \/  |  _ \ / ___|
" \ \ / / | || |\/| | |_) | |    
" _\ V /  | || |  | |  _ <| |___ 
"(_)\_/  |___|_|  |_|_| \_\\____|
" 
"https://towardsdatascience.com/the-essential-ideavim-remaps-291d4cd3971b
"https://www.linuxfordevices.com/tutorials/linux/turn-vim-into-an-ide
"https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
set nocompatible



" PLUGINS

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'LunarWatcher/auto-pairs'
Plug 'maxboisvert/vim-simple-complete'
Plug 'majutsushi/tagbar'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'matze/vim-move'

call plug#end()

" DEFAULT SETTINGS --------------------------------------------------------------- {{{

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_save = 1
let g:syntastic_check_on_wq = 0

set encoding=utf-8

set tabstop=4
set expandtab
filetype on
filetype plugin on
filetype indent on
set cursorline

hi MatchParen cterm=none ctermbg=green ctermfg=black 
set nu
set ruler
set mouse=a
set nolist
set laststatus=2
set nobackup
set nowrap
set incsearch
set smartcase
set showcmd
set showmatch
set hlsearch
set history=1000

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

map <C-c> <Esc>
nnoremap <silent> <C-Left> :tabprevious<CR>                                                                            
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Up> :tabnew<CR>

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

""""""""""""""""""
" vim-move : https://github.com/matze/vim-move
""""""""""""""""""

let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'S'

""""""""""""""""""
" NERDTREE : https://github.com/preservim/nerdtree
""""""""""""""""""

"mapping
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

""""""""""""""""""
" tag bar : https://github.com/preservim/tagbar
""""""""""""""""""

"mapping
nmap  <silent> <C-b> : TagbarToggle<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" }}}

