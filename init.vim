call plug#begin('~/.config/nvim/plugged')
" utils

Plug 'https://github.com/preservim/nerdtree.git'
Plug 'scrooloose/nerdcommenter'
Plug 'pbondoer/vim-42header'
Plug 'VundleVim/Vundle.vim'
Plug 'ryanoasis/vim-devicons'

" git
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" debug

"Plug 'puremourning/vimspector'

" readability

Plug 'junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'https://github.com/preservim/tagbar'
Plug 'sheerun/vim-polyglot'
"Plug 'dracula/vim'
"Plug 'morhetz/gruvbox'
"Plug 'roosta/srcery'

"auto complete

Plug 'raimondi/delimitmate'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
"Plug 'valloric/youcompleteme'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'https://github.com/garbas/vim-snipmate.git'
"Plug 'shougo/neocomplcache.vim'
call plug#end()

filetype on

" leader key
let mapleader = ","

" header
let g:hdr42user = 'yoyoo'
let g:hdr42mail = 'yoyoo@student.42seoul.kr'

" compiler
"let g:neocomplcache_enable_at_startup = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = "-Wall -Wextra -Werror"

"let g:vimspector_enable_mappings = 'HUMAN'
"nmap <leader>dd :call vimspector#Launch()<CR>
"nmap <leader>dx :VimspectorReset<CR>
"nmap <Leader>di <Plug>VimspectorBalloonEval
"nmap <leader>de :VimspectorEval
"nmap <leader>dw :VimspectorWatch
"nmap <leader>do :VimspectorShowOutput


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" utils

Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'MultipleSearch'
Plugin 'surround.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'

" readability

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'Yggdroot/indentline'
"Plugin 'frazrepo/vim-rainbow' " html conflict -> syntax off 

call vundle#end()

" plugin setting

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:EasyMotion_smartcase=1

let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indentguides_tabchar = '┆'
let g:indentguides_spacechar = '|'
let g:indent_guides_start_level=2
let g:user_emmet_leader_key=','

let g:multi_cursor_use_default_mapping=1

let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
let	g:NERDTreeNodeDelimiter = 1

let delimitmate_expand_cr=1

let g:NERDCompactSexyComs = 1
"let g:rainbow_active = 0
let g:EasyMotion_do_mapping=1

filetype plugin indent on

" vim setting

set backspace=indent,eol,start
set wmnu
set number
syntax on
set tabstop=4
set sts=4
set cindent
set smartindent
set hlsearch
set softtabstop=4
set shiftwidth=4
set nopaste
set title
set nocompatible
set ignorecase
colorscheme jellybeans
set encoding=utf-8
set tags=./tags;,tags;,../tags;,../../tags;,../../../tags;,../../../../tags;,/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include;
set laststatus=2
"set autoindent
"set list listchars=tab:·\ ,eol:$ "마지막 라인에 $표시
"set tags=./tags,tags
"set clipboard=unnamed
"set showmatch

" key-setting

map qq :q!<cr>
map qa :qa!<cr>
map wq :wq!<cr>
map we :w!<cr>
map qd :sh<cr>
map qz v]}zf
map qo zo
vnoremap y y`>
vnoremap Y Y`>
noremap p p`]
"nnoremap <C-w> <C-w>w

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

nmap <leader>t :Tagbar<CR>

map <leader>n :NERDTreeToggle<cr>
map <leader>q :bp<cr>
map <leader>w :bn<cr>

map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment

map <Leader>f <Plul>(easymotion-prefix)
map <leader><leader> <Plug>(easymotion-prefix)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
"map  <leader><leader>F <Plug>(easymotion-bd-f)
"" Move to line
map <leader><leader>l <Plug>(easymotion-bd-jk)
"nmap <leader><leader>l <Plug>(easymotion-overwin-line)
"" Move to word
map  <leader><leader>w <Plug>(easymotion-bd-w)
"nmap <leader><leader>w <Plug>(easymotion-overwin-w)
"" s{char}{char} to move to {char}{char}
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)

map  <leader>r <plug>(coc-rename)
nnoremap <leader>d :call CocAction('jumpDefinition', 'split')<CR>
"nmap <silent> gd <Plug>(coc-definition)

" maintain cursor position
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType js setlocal shiftwidth=2 softtabstop=2 tabstop=2 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
