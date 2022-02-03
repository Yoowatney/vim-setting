source ~/.config/nvim/after/colors/solarized.vim
call plug#begin('~/.config/nvim/plugged')
" utils

Plug 'preservim/nerdcommenter'
Plug 'pbondoer/vim-42header'
Plug 'ryanoasis/vim-devicons'
Plug 'pechorin/any-jump.vim'
Plug 'moll/vim-node'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'diepm/vim-rest-console'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'digitaltoad/vim-pug'
Plug 'tommcdo/vim-exchange'
Plug 't9md/vim-textmanip'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'preservim/tagbar'
Plug 'akinsho/toggleterm.nvim'
Plug 'johngrib/vim-f-hangul'
Plug 'guns/vim-sexp'
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'henriquehbr/ataraxis.lua'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'sindrets/winshift.nvim'
" Plug 'dense-analysis/ale'
" Plug 'zirrostig/vim-schlepp'
"Plug 'nvim-telescope/telescope.nvim'

" git

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" debug

"Plug 'puremourning/vimspector'

" readability
"
Plug 'blueyed/vim-diminactive'
Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/indentline'
Plug 'nanotech/jellybeans.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'dracula/vim'
"Plug 'morhetz/gruvbox'
"Plug 'roosta/srcery'

"auto complete

Plug 'ludovicchabant/vim-gutentags'
Plug 'raimondi/delimitmate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'windwp/nvim-autopairs'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'github/copilot.vim'
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
endif
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
" Plug 'wookayin/vim-autoimport'
" Plug 'steelsojka/pears.nvim'
" Plug 'tomtom/stakeholders_vim'
" Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
"Plug 'vim-syntastic/syntastic'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'valloric/youcompleteme'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'shougo/neocomplcache.vim'
call plug#end()



" leader key
let mapleader = ","

call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('renderer', wilder#popupmenu_renderer({
	  \ 'pumblend': 20,
	  \ }))
" let g:fern#drawer_width = 30
" let g:fern#default_hidden = 1
" let g:fern#disable_drawer_auto_quit = 1
" let g:fern#renderer = "nerdfont"

let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

let g:hdr42user = 'yoyoo'
let g:hdr42mail = 'yoyoo@student.42seoul.kr'


"let g:vimspector_enable_mappings = 'HUMAN'
"nmap <leader>dd :call vimspector#Launch()<CR>
"nmap <leader>dx :VimspectorReset<CR>
"nmap <Leader>di <Plug>VimspectorBalloonEval
"nmap <leader>de :VimspectorEval
"nmap <leader>dw :VimspectorWatch
"nmap <leader>do :VimspectorShowOutput


" let g:ale_lint_on_save = 1              "Lint when saving a file
" let g:ale_sign_error = '✖'                                                      "Lint error sign
" let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
" let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts
" let g:ale_linters = {'javascript': ['eslint']}
" let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_disable_lsp = 1

let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
	\ 'coc-clangd',
	\ 'coc-html',
	\ 'coc-git',]
" plugin setting
let g:coc_node_path = '/usr/local/bin/node'
let g:diminactive_enable_focus = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:EasyMotion_smartcase=1

" let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
" let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
" let g:airline#extensions#tabline#buffer_nr_format = '%s ' " buffer number format


let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indentguides_tabchar = '┆'
let g:indentguides_spacechar = '|'
let g:indent_guides_start_level=1
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

let g:vrc_allow_get_request_body = 1

let g:toggleterm_terminal_mapping = '<C-t>'

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><leader><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><leader><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

" nnoremap <silent><c-w> :ToggleTerm dir=. direction=float<CR>
" inoremap <silent><c-w> <ESC>:ToggleTerm dir=. direction=float<CR>
" tnoremap <c-a> exit<CR>

let delimitmate_expand_cr=1

let g:NERDCompactSexyComs = 1
let g:EasyMotion_do_mapping=1

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


" This is the default extra key bindings

" Default fzf layout
" - Popup window (anchored to the bottom of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
" let g:fzf_layout = { 'up': '40%' }

" - Window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:sexp_filetypes = ''

let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_pinned = '📌'

let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_add_trailing = 1
" let g:nvim_tree_group_empty = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_symlink_arrow = ' >> '
let g:nvim_tree_respect_buf_cwd = 1
let g:nvim_tree_create_in_closed_folder = 0
let g:nvim_tree_refresh_wait = 500
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
let g:nvim_tree_show_icons = {
	\ 'git': 1,
	\ 'folders': 1,
	\ 'files': 1,
	\ 'folder_arrows': 1,
	\ }
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }



set termguicolors

highlight NvimTreeFolderIcon guibg=blue

"let g:webdevicons_conceal_nerdtree_brackets = 1

lua <<EOF
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
EOF

" lua <<EOF
" require "pears".setup(function(conf)
"   conf.pair("{", "}")
"   conf.expand_on_enter(false)
" end)
" EOF

lua <<EOF
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = { "" },
  highlight = {
	enable = true,
	disable = { "" },
	additional_vim_regex_highlighting = true,
  },
}
EOF

lua <<EOF
require'nvim-web-devicons'.get_icons()
EOF


lua <<EOF
require'nvim-web-devicons'.setup {
	-- your personnal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh"
			},
		},
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true;
	}
EOF

lua <<EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
EOF

lua <<EOF
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
npairs.setup({map_cr=false})

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
if vim.fn.pumvisible() ~= 0  then
    return vim.fn["coc#_select_confirm"]()
else
	return npairs.autopairs_cr()
end
end
remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
EOF

lua << EOF
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  },
  -- The window picker is used to select a window while swapping windows with
  -- ':WinShift swap'.
  -- A string of chars used as identifiers by the window picker.
  window_picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  window_picker_ignore = {
    -- This table allows you to indicate to the window picker that a window
    -- should be ignored if its buffer matches any of the following criteria.
    filetype = {  -- List of ignored file types
      "NvimTree",
    },
    buftype = {   -- List of ignored buftypes
      "terminal",
      "quickfix",
    },
    bufname = {   -- List of regex patterns matching ignored buffer names
      [[.*foo/bar/baz\.qux]]
    },
  },
})
EOF
lua <<EOF
require('nvim-autopairs').setup({
  enable_check_bracket_line = false,
  check_ts = true,
  map_bs = true,
  map_c_w = false,
})
EOF

lua <<EOF
require('nvim-window').setup({
  -- The characters available for hinting windows.
  chars = {
	  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  },

  -- A group to use for overwriting the Normal highlight group in the floating
  -- window. This can be used to change the background color.
  normal_hl = 'IncSearch', -- 주로씀 IncSearch, StatusLine, error


  -- The highlight group to apply to the line that contains the hint characters.
  -- This is used to make them stand out more.
  hint_hl = 'Bold',

  -- The border style to use for the floating window.
  border = 'none'
})
EOF


" require('nvim-autopairs').setup({
"   disable_filetype = { "TelescopePrompt" , "vim" },
" })
" EOF

lua <<EOF
require("toggleterm").setup{
-- size can be a number or function which is passed the current terminal
shade_terminals = true,
shading_factor = 1,-- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
direction='float',
start_in_insert = true,
insert_mappings = true, -- whether or not the open mapping applies in insert mode
persist_size = true,
close_on_exit = true, -- close the terminal window when the process exits
shell = vim.o.shell, -- change the default shell
-- This field is only relevant if direction is set to 'float'
float_opts = {
	-- The border key is *almost* the same as 'nvim_open_win'
	-- see :h nvim_open_win for details on borders however
	-- the 'curved' border is a custom border type
	-- not natively supported but implemented in this plugin.
	border = 'curved',
	winblend = 3,
	highlights = {
		border = "shadow",
		background = "Normal",
		}
	}
}
EOF

" local npairs = require("nvim-autopairs")
"
" npairs.setup({
"     check_ts = true,
"     ts_config = {
"         lua = {'string'},-- it will not add a pair on that treesitter node
"         javascript = {'template_string'},
"         java = false,-- don't check treesitter on java
"     }
" })

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! LightLineFilename()
  return WebDevIconsGetFileTypeSymbol(expand('%')) . ' ' . expand('%')
endfunction

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
"set nocompatible
set ignorecase
colorscheme jellybeans
set encoding=utf-8
set termencoding=utf-8
set tags=./tags;,tags;,../tags;,../../tags;,../../../tags;,../../../../tags;
set laststatus=2
"set autoindent
"set list listchars=tab:·\ ,eol:$ "마지막 라인에 $표시
"set tags=./tags,tags
"set clipboard=unnamed
"set showmatch

" key-setting

map Q <Nop>
map <silent>QQ :q!<cr>
map <silent>ㅃㅃ :q!<cr>
map <silent>W :w!<cr>

map <silent>qd :te<cr>
map <silent>fz v]}zf
map <silent>fo zo
map <silent>M :nohl<CR>

" Start Win-Move mode:
nnoremap <C-W>m <Cmd>WinShift<CR>

nmap <silent> ˙ <Plug>(sexp_swap_element_backward)
xmap <silent> ˙ <Plug>(sexp_swap_element_backward)
nmap <silent> ¬ <Plug>(sexp_swap_element_forward)
xmap <silent> ¬ <Plug>(sexp_swap_element_forward)
nmap <silent> ( <Plug>(sexp_move_to_prev_bracket)
xmap <silent> ( <Plug>(sexp_move_to_prev_bracket)
omap <silent> ( <Plug>(sexp_move_to_prev_bracket)
nmap <silent> ) <Plug>(sexp_move_to_next_bracket)
xmap <silent> ) <Plug>(sexp_move_to_next_bracket)
omap <silent> ) <Plug>(sexp_move_to_next_bracket)

map <silent> <leader><C-w> :lua require('nvim-window').pick()<CR>


vnoremap y y`>
vnoremap Y Y`>
noremap p p`]
"nnoremap <C-w> <C-w>w

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
inoremap <C-g> <C-o>x



" line copy
" nnoremap <silent> :t -<CR>==
" nnoremap <silent>Ô :t .<CR>==
"
" vnoremap <silent> :'<,'>t -2<CR>gv=gv
" vnoremap <silent>Ô :'<,'>t +1<CR>gv=gv
"
" nnoremap <silent>¬ xp
" nnoremap <silent>˙ xhhp

" line move

"
" vmap <unique> ˚  <Plug>SchleppUp
" vmap <unique> ∆  <Plug>SchleppDown
" vmap <unique> <left>  <Plug>SchleppLeft
" vmap <unique> <right> <Plug>SchleppRight

" option shift k
xmap  <Plug>(textmanip-duplicate-up)
nmap  <Plug>(textmanip-duplicate-up)
inoremap <silent> <Esc>:t -<CR>==gi

" option shift j
xmap Ô <Plug>(textmanip-duplicate-down) 
nmap Ô <Plug>(textmanip-duplicate-down)
inoremap <silent>Ô <Esc>:t .<CR>==gi

" create blank
nmap <CR>   <Plug>(textmanip-blank-below)
nmap <S-CR> <Plug>(textmanip-blank-above)
xmap <CR>   <Plug>(textmanip-blank-below)
xmap <S-CR> <Plug>(textmanip-blank-above)

" moving word
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-l> <Plug>(textmanip-move-right)

" moving line
nnoremap <silent>˚ :m .-2<CR>==
nnoremap <silent>∆ :m .+1<CR>==
inoremap <silent>˚ <Esc>:m .-2<CR>==gi
inoremap <silent>∆ <Esc>:m .+1<CR>==gi
vnoremap <silent>˚ :m '<-2<CR>gv=gv
vnoremap <silent>∆ :m '>+1<CR>gv=gv

" hook
xmap  <Up>    <Plug>(textmanip-move-up-r)
xmap  <Down>  <Plug>(textmanip-move-down-r)
xmap  <Left>  <Plug>(textmanip-move-left-r)
xmap  <Right> <Plug>(textmanip-move-right-r)

" nmap <F10> <Plug>(textmanip-toggle-mode)
" xmap <F10> <Plug>(textmanip-toggle-mode)


" nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

nmap <leader>t :Tagbar<CR>

nnoremap <leader>n :NvimTreeToggle<CR>
"nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>pp :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" noremap <silent><leader>q :bp<cr>
" noremap <silent><leader>d :bd!<cr>
" noremap <silent><leader>w :bn<cr>
"
nnoremap + :vert res +1<CR>
nnoremap _ :vert res -1<CR>

nnoremap <silent>    <leader>q :BufferPrevious<CR>
nnoremap <silent>    <leader>w :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <leader>< :BufferMovePrevious<CR>
nnoremap <silent>    <leader>> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent><leader>1 :BufferGoto 1<CR>
nnoremap <silent><leader>2 :BufferGoto 2<CR>
nnoremap <silent><leader>3 :BufferGoto 3<CR>
nnoremap <silent><leader>4 :BufferGoto 4<CR>
nnoremap <silent><leader>5 :BufferGoto 5<CR>
nnoremap <silent><leader>6 :BufferGoto 6<CR>
nnoremap <silent><leader>7 :BufferGoto 7<CR>
nnoremap <silent><leader>8 :BufferGoto 8<CR>
nnoremap <silent><leader>9 :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent><leader>p :BufferPin<CR>
" Close buffer
nnoremap <silent><leader>d :BufferClose<CR>

" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
" nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
" nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

"nnoremap <leader>ff <cmd>Telescope find_files theme=dropdown prompt_prefix=🔍<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commits<CR> 

map <leader>s <Plug>(easymotion-overwin-f)
"map  <leader><leader>F <Plug>(easymotion-bd-f)
"" Move to line
" map <leader><leader>l <Plug>(easymotion-bd-jk)
"nmap <leader><leader>l <Plug>(easymotion-overwin-line)
"" Move to word
" map  <leader><leader>w <Plug>(easymotion-bd-w)
" nmap <leader><leader>s <Plug>(easymotion-overwin-f2)

" nvim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

if has('nvim')
  inoremap <silent><expr> <c-l> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent><leader>fi <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>ra  <Plug>(coc-refactor)

" multi cursor shortcuts
nmap <silent> <C-a> <Plug>(coc-cursors-word)
xmap <silent> <C-a> <Plug>(coc-cursors-range

" input
xmap if <Plug>(coc-funcobj-i) 
omap if <Plug>(coc-funcobj-i)
" all
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>i

"stay cursor position
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 
let g:user_emmet_install_global = 0
autocmd FileType html,css,ejs,pug EmmetInstall
au BufNewFile,BufRead *.ejs set filetype=html
"autocmd User TelescopePreviewerLoaded setlocal wrap
