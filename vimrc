
" disable some plugins
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'syntastic')

" Syntastic
" let g:syntastic_check_on_wq=0

execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible  " We don't want vi compatibility.

" stuff from nvie.com/posts/how-i-boosted-my-vim
set copyindent
set shiftwidth=4								"number of spaces for autoindenting
set ignorecase									" ignore case when searching
set smartcase										" ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch										" highlight search terms!
set incsearch										" show search matches as you type

" When searching, will wrap from bottom of buffer to top when 'nexting'
set wrapscan

" Use spaces instead of the actual tab char
set expandtab
set tabstop=2

" Show line numbers
set number
set hidden
set title

set colorcolumn=81

" make cmd+copy works in vim
set clipboard=unnamed

" let mapleader=","
" Tagbar
nmap <silent> <leader>rt :TagbarToggle<CR>
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
"
"
"
" set color
"
" syntax enable
" set background=light
" colorscheme solarized
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
