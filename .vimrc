set number
set encoding=utf-8
set backspace=indent,eol,start
set tabstop=4
set sts=4
set cindent
set smartindent
set hlsearch
set softtabstop=4
set shiftwidth=4
set nopaste
set title
set ignorecase
set nobackup
set noswapfile
set nowritebackup
set relativenumber

syntax on

nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap QQ: q!<CR>
nnoremap W: w!<CR>
nnoremap s <nop>
nnoremap S <nop>
nnoremap Q <nop>

au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
