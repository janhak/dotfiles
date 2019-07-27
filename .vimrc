" Jan Chwiejczak

" Init {{{
execute pathogen#infect()
" }}}
" General {{{
set nocompatible    " Loose backwards vi compatibility - really
set encoding=utf-8
set laststatus=2    " Always show powerline
set noshowmode      " Hide the default mode text
set showcmd         " Show command as you type it
set autowrite
:au FocusLost * silent! wa "Save buffers when focus is lost
" Enable filetype plugins
filetype plugin on
filetype indent on
syntax enable       " Enable syntax highlighting
" }}}
" Spaces & Tabs {{{
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
" }}}
" UI Config {{{
set clipboard=unnamed
set wildmenu      " visual autocomplete for command menu
set wildignore=*.swp,*.bak,*.pyc,*.class
set showmatch     " highlight matching [{()}]
set lazyredraw    " redraw only when we need to.
set noerrorbells  " don't beep
" }}}
" GUI Config {{{
set background=dark
colorscheme solarized
if has ('gui_running')
    set guifont=InconsolataGo\ 13
endif
"}}}
" Searching {{{
set incsearch   " search as characters are entered   
set hlsearch    " highlight matches
set ignorecase  " ignore case when searching
set smartcase    " ignore case if search pattern is all lowercase, case-sensitive otherwise
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent 
"}}}
" Custom Mappings {{{
inoremap jk <ESC>

" highlight last inserted text
nnoremap gV `[v`]

" Easy movement over folded lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
"nnorempa B ^ nnoremap E $ - hmmm?
" }}}
" Leader Shortcuts {{{
let mapleader = "\<SPACE>"

" jump to begging and end of line
nnoremap <leader>b ^ 
nnoremap <leader>e $ 

" quickly edit and save .vimrc file
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" open ag.vim
" nnoremap <leader>a :Ag

" }}}
" Powerline  {{{
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
"}}}
" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"}}}
" Syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
"}}}
" Jedi Autocomplete {{{
" Surpresses the docstring window on top
autocmd FileType python setlocal completeopt-=preview
" }}}
" Gundo Tree {{{
let g:gundo_prefer_python3=1
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter Makefile setlocal noexpandtab
augroup END
"}}}
" Custom Functions {{{

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
"}}}

set modelines=1
" vim:foldmethod=marker:foldlevel=0
