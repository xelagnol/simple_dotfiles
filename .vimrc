set nocompatible
set background=dark
syntax on
colorscheme solarized

map <ScrollWheelUp> <C-Y><C-Y>
map <ScrollWheelDown> <C-E><C-E><C-E><C-E>

filetype off

set shell=bash
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/Vundle.vim' "Vim package manager

"""" VIM PLUGINS

" Auto-completion in Vim, but this is kind of a pain to set up
" Plugin 'Valloric/YouCompleteMe' 


" Git commands from with vim, ex: ':Gstatus'
Plugin 'tpope/vim-fugitive'

" automatic closing of quotes, brackets, etc. and other stuff
" Bundle 'Raimondi/delimitMate'

" lets you use tab to do auto-completion
Bundle 'ervandew/supertab'

" Quick file search from within vim
Plugin 'kien/ctrlp.vim'

" Displays symbols in left-hand gutter for changed, removed, added lines
Plugin 'airblade/vim-gitgutter'

" Plugin 'nvie/vim-flake8'
" UltiSnips lets you insert code snippets
" Bundle 'SirVer/UltiSnips'
" Bundle 'honza/vim-snippets'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'tpope/vim-surround'
" Bundle 'scrooloose/nerdcommenter'

" Visualize your undo tree
Bundle 'sjl/gundo.vim'

" Coffee script syntax highlighting
Bundle 'kchmck/vim-coffee-script'

" Syntax highlighting for various languages
Bundle 'scrooloose/syntastic'

" Directory navigation in vim
Bundle 'scrooloose/nerdtree'

" Literate coffee script syntax highlighting
Bundle 'mintplant/vim-literate-coffeescript'

Bundle 'vim-scripts/vim-auto-save'

"""" END VIM PLUGINS

" AutoSave settings
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_events = ["InsertLeave", "TextChanged"]
 
" CtrlP settings
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = {
      \ 'file': '\v\.(aux|o|pyc)',
      \ 'dir': '\v[\/](node_modules|bower_components)',
 \ }
nnoremap <leader>. :CtrlPTag<cr>

" Little vim settings
set hlsearch         " highlights all searched items"
set shiftwidth=4
set tabstop=4
set expandtab
set ruler            " displays cursor location
set backspace=2
set autoindent
set smartindent
set showmatch        " shows matching braces
set virtualedit=all  " changes how visual block highlights space w/o text in it
set incsearch        " incrementally searches as you type, as opposed to waiting until you push enter
set cursorline
set ignorecase
set smartcase
set undofile
set undodir=/Users/alex.long/.vimundo/
set gfn=Monospace\ 9 " sets font

let g:solarized_termtrans=1

autocmd FileType tex set wrap|set textwidth=65
autocmd FileType markdown set wrap|set textwidth=65|set shiftwidth=4|set tabstop=4
autocmd FileType config setf dosini
au BufNewFile,BufRead *.txt set filetype=markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.tex set filetype=tex
au BufNewFile,BufRead *.conf set filetype=config

au BufNewFile,BufRead *.R set filetype=r
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let python_highlight_all=1

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:sparkupExecuteMapping="<C-h>"

:command Markdown ! markdown % > %:r.html

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_flake8_args = '--ignore=E111'

filetype off
filetype plugin on
filetype indent plugin on


hi normal ctermfg=12 "sets the main text to brblue properly

set number

set foldmethod=indent
set foldlevelstart=99
set mouse=a
set hidden

" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.

command -nargs=0 -bar Update if &modified 
    \| if empty(bufname('%'))
    \|  browse confirm write
    \| else
    \|  confirm write
    \| endif
    \|endif

nnoremap <silent> <C-S> :<C-u>Update<CR>
nnoremap <F5> :GundoToggle<CR>
"map <Enter> o<ESC>
"map <Space> O<ESC>j
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>
inoremap <F10> <esc>:w rerunplease.tmp<CR>:w<cr>a
nnoremap <F10> :w rerunplease.tmp<CR>:w<cr>

nnoremap g: g;
nnoremap <F9> ebye /<C-R>"<CR>
nnoremap <F8> ebye ?<C-R>"<CR>n
nnoremap <Space> <C-f>
nnoremap <C-Space> <C-b>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent> ,/ :nohlsearch<CR>

nnoremap ; :
nnoremap : ;

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR> 

nnoremap <leader>j :%!python -m json.tool<CR> 

nnoremap <silent> <F3> :call ShiftToggle()<CR>

let g:shift_toggle_state = 0

function! ShiftToggle()
    " Test the setting 'diff', to see if it's on or off.
    " (Any :set option can be tested with &name.
    " See :help expr-option.)
    if g:shift_toggle_state
        echo "Shift toggle is now off, keys will now print their nornmal values"
        inoremap 9 9
        inoremap ( (
        inoremap 0 0
        inoremap ) )
        
        nnoremap ' '
        nnoremap " "
        inoremap ' '
        inoremap " "
        
        nnoremap _ _
        nnoremap - -
        inoremap _ _
        inoremap - -
        
        inoremap ; ;
        inoremap : :
        let g:shift_toggle_state = 0
    else
        echo "Shift toggle is now on, some keys will now have their shift and non-shift values swapped"
        inoremap 9 (
        inoremap ( 9
        inoremap 0 )
        inoremap ) 0
        
        nnoremap ' "
        nnoremap " '
        inoremap ' "
        inoremap " '
        
        nnoremap _ -
        nnoremap - _
        inoremap _ -
        inoremap - _
        
        inoremap ; :
        inoremap : ;
        let g:shift_toggle_state = 1
    endif
:endfunction

" Toggle diffmode
" Set up a keymapping from <Leader>df to a function call.
" (Note the function doesn't need to be defined beforehand.)
" Run this mapping silently. That is, when I call this mapping,
" don't bother showing "call DiffToggle()" on the command line.
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

" Define a function called DiffToggle.
" The ! overwrites any existing definition by this name.
function! DiffToggle()
    " Test the setting 'diff', to see if it's on or off.
    " (Any :set option can be tested with &name.
    " See :help expr-option.)
    if &diff
        windo diffoff
    else
        windo diffthis
    endif
:endfunction
