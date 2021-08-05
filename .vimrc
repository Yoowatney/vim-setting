call plug#begin('~/.vim/plugged')
Plug 'pbondoer/vim-42header'
"NERD tree
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'scrooloose/nerdcommenter'
"tagbar
"Plug 'https://github.com/preservim/tagbar'
"git
Plug 'https://github.com/tpope/vim-fugitive'
"color
"Plug 'dracula/vim'
"Plug 'morhetz/gruvbox'
"Plug 'roosta/srcery'
"
Plug 'https://github.com/nanotech/jellybeans.vim'
"auto complete
"Plug 'valloric/youcompleteme'
Plug 'raimondi/delimitmate'
Plug 'shougo/neocomplcache.vim'
Plug 'VundleVim/Vundle.vim'
Plug 'https://github.com/vim-syntastic/syntastic.git'

"Plug 'https://github.com/garbas/vim-snipmate.git'
call plug#end()
filetype on

" leader
let mapleader = ","

" header
let g:hdr42user = 'yoyoo'
let g:hdr42mail = 'yoyoo@student.42seoul.kr'

" auto 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:neocomplcache_enable_at_startup = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = " -Wall -Wextra -Werror"


"마지막 라인에 $표시
"set list listchars=tab:·\ ,eol:$


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"auto completion

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'

"cursor move fastly
Plugin 'Lokaltog/vim-easymotion'

"bottom
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"search
Plugin 'MultipleSearch'

"line clearly
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'frazrepo/vim-rainbow'
Plugin 'surround.vim'
Plugin 'jiangmiao/auto-pairs'

Plugin 'terryma/vim-smooth-scroll'

"Plugin 'Yggdroot/indentline'
call vundle#end()

" let g:EasyMotion_do_mapping=1

let g:EasyMotion_smartcase=1

" rainbow
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
set laststatus=2
"let g:airline_theme='hybrid'

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indentguides_tabchar = '┆'
let g:indentguides_spacechar = '|'
let g:indent_guides_start_level=2

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_warning_symbol = '>*'
let g:ycm_min_num_of_chars_for_completion = 2


" NerdTree
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
let	g:NERDTreeNodeDelimiter = 1

" delimitmate

let delimitmate_expand_cr=1
" commerter
let g:NERDCompactSexyComs = 1

filetype plugin indent on



set backspace=indent,eol,start
set wmnu
set number
syntax on
set tabstop=4
set shiftwidth=4
set sts=4
set cindent
set smartindent
"set autoindent

set hlsearch

set softtabstop=4
set shiftwidth=4
set nopaste
set title
set nocompatible
"set showmatch
set ignorecase
set clipboard=unnamed
colorscheme jellybeans
set encoding=utf-8

" key-setting

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>

nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


"nnoremap <C-w> <C-w>w
map qq :q!<cr>
map wq :wq!<cr>
map we :w!<cr>
map <F3> :NERDTreeToggle<cr>
map <F4> :bd<cr>
map <F5> :bp<cr>
map <F6> :bn<cr>
map <F9> :! ./a.out \| cat \-e<CR>
map <F12> :! ./a.out<CR>
"map -- :! gcc % -o a.out<CR>
"map == :! gcc % -o a.out -L . -lft<CR>
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment
"easy motion
"map <Leader>f <Plug>(easymotion-prefix)
"map <leader><leader> <Plug>(easymotion-prefix)
"" <leader>f{char} to move to {char}
"map  <leader><leader>f <Plug>(easymotion-bd-f)
"nmap <leader><leader>f <Plug>(easymotion-overwin-f)

"" s{char}{char} to move to {char}{char}
"nmap <leader><leader>s <Plug>(easymotion-overwin-f2)

"" Move to line
"map <leader><leader>L <Plug>(easymotion-bd-jk)
"nmap <leader><leader>L <Plug>(easymotion-overwin-line)
"" Move to word
"map  <leader><leader>w <Plug>(easymotion-bd-w)
"nmap <leader><leader>w <Plug>(easymotion-overwin-w)
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

vnoremap y y`>
vnoremap Y Y`>
noremap p p`]
