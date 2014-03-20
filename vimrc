scriptencoding utf-8
set encoding=utf-8
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
set wildignore=*.swp,*.bak,*.pyc,*.class

" When searching, will wrap from bottom of buffer to top when 'nexting'
set wrapscan

" Use spaces instead of the actual tab char
set expandtab
set tabstop=2

" Show line numbers
set number
set hidden
set title

set colorcolumn=80

" make cmd+copy works in vim
set clipboard=unnamed

" let mapleader=","
" Tagbar
nmap <silent> <leader>rt :TagbarToggle<CR>
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
"
"
"
" set color scheme solarized

syntax enable
set background=dark
if has('gui_running')
    set background=dark
else
    set background=dark
endif
 let g:solarized_termtrans = 1
 let g:solarized_termcolors=256
 colorscheme solarized

"
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Show whitespace
set list listchars=tab:»·,trail:·
" Highlight trailing/leading whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

 " $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
 " Indent Python in the Google way.

 setlocal indentexpr=GetGooglePythonIndent(v:lnum)

 let s:maxoff = 50 " maximum number of lines to look backwards.

 function GetGooglePythonIndent(lnum)

   " Indent inside parens.
   " Align with the open paren unless it is at the end of the line.
   " E.g.
   "   open_paren_not_at_EOL(100,
   "                         (200,
   "                          300),
   "                         400)
   "   open_paren_at_EOL(
   "       100, 200, 300, 400)
   call cursor(a:lnum, 1)
   let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
         \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
         \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
         \ . " =~ '\\(Comment\\|String\\)$'")
   if par_line > 0
     call cursor(par_line, 1)
     if par_col != col("$") - 1
       return par_col
     endif
   endif

   " Delegate the rest to the original function.
   return GetPythonIndent(a:lnum)

 endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
" End of Indent Python in the Google way.
" $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

let g:pyflakes_use_quickfix = 0

" autocmd BufWritePost *.py call Flake8()

" NerdTree
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror
" autocmd VimEnter * wincmd w
let NERDTreeIgnore = ['\.pyc$']

" rope
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
