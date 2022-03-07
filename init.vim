call plug#begin('~/.config/nvim/plugged')
" utils

Plug 'pbondoer/vim-42header'
Plug 'ryanoasis/vim-devicons'
Plug 'moll/vim-node'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'phaazon/hop.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tommcdo/vim-exchange'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'akinsho/toggleterm.nvim'
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'henriquehbr/ataraxis.lua'
Plug 'sindrets/winshift.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'abecodes/tabout.nvim'
Plug 'tpope/vim-speeddating'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'chentau/marks.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'Pocco81/AbbrevMan.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'blueyed/vim-diminactive'
Plug 'Pocco81/TrueZen.nvim'
" Plug 'tpope/vim-fugitive'


" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'diepm/vim-rest-console'
" Plug 'IngoMeyer441/coc_current_word'
" Plug 'NTBBloodbath/rest.nvim'
" Plug 'easymotion/vim-easymotion'
" Plug 'digitaltoad/vim-pug'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'mhinz/vim-startify'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'johngrib/vim-f-hangul'
" Plug 'lambdalisue/fern.vim'
" Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Plug 'lambdalisue/glyph-palette.vim'
" Plug 'guns/vim-sexp'
" Plug 'preservim/tagbar'
" Plug 'dense-analysis/ale'
" Plug 'zirrostig/vim-schlepp'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" git

" Plug 'airblade/vim-gitgutter'

" debug
"Plug 'puremourning/vimspector'

" readability
"
Plug 'pangloss/vim-javascript'
Plug 'nanotech/jellybeans.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'sheerun/vim-polyglot'
" Plug 'Yggdroot/indentline'
"Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'blueyed/vim-diminactive'
"Plug 'dracula/vim'
" Plug 'morhetz/gruvbox'
"Plug 'roosta/srcery'

"auto complete

Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'windwp/nvim-autopairs'
Plug 'roxma/nvim-yarp'
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
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'raimondi/delimitmate'
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

call wilder#setup({
			\ 'modes': [':', '/', '?'],
			\ 'next_key': '<C-j>',
			\ 'previous_key' : '<C-k>',
			\	})

call wilder#set_option('renderer', wilder#popupmenu_renderer({
	  \ 'pumblend': 20,
	  \ }))
" let g:fern#drawer_width = 30
" let g:fern#default_hidden = 1
" let g:fern#disable_drawer_auto_quit = 1
" let g:fern#renderer = "nerdfont"

" snippet
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" 42 header
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

" coc
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-json',
	\ 'coc-clangd',
	\ 'coc-vimlsp',
	\ 'coc-pyright',]
let g:coc_node_path = '/usr/local/bin/node'
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

"diminiactvie
" let g:diminactive_enable_focus = 1
" let g:diminactive_use_colorcolumn = 1
" let g:diminactive_use_syntax = 1


" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


" let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
" let g:airline#extensions#tabline#buffer_nr_format = '%s ' " buffer number format


" rest-console
" let g:vrc_allow_get_request_body = 1

let g:toggleterm_terminal_mapping = '<C-t>'

" toggle term
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


" nvim webdevicon
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

" let g:fzf_history_dir = '~/.local/share/fzf-history'

" s-exp
" let g:sexp_filetypes = ''

" barber
let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_pinned = '📌'

" vim-illuminate
let g:Illuminate_delay = 500
" hi illuminatedWord cterm=undercurl gui=undercurl
let g:copilot_filetypes = {
		\ 'python' : v:false
	  \ }

" nvim-tree
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


lua <<EOF
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require'hop'.setup()
require('Comment').setup()
require('telescope').load_extension('coc')
require("telescope").setup {
  extensions = {
    file_browser = {
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
	hidden = true,
	respect_gitignore = false,
    },
  },
}
require("telescope").load_extension "file_browser"

EOF

lua <<EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF

lua << EOF
local abbrev_man = require("abbrev-man")

abbrev_man.setup({
	load_natural_dictionaries_at_startup = true,
	load_programming_dictionaries_at_startup = true,
	natural_dictionaries = {
		["nt_en"] = {}
	},
	programming_dictionaries = {
		["pr_py"] = {}
	}

})
EOF
" lua <<EOF
" require("rest-nvim").setup({
"   -- Open request results in a horizontal split
"   result_split_horizontal = false,
"   -- Skip SSL verification, useful for unknown certificates
"   skip_ssl_verification = false,
"   -- Highlight request on run
"   highlight = {
"       enabled = true,
"       timeout = 150,
"   },
"   -- Jump to request line on run
"   jump_to_request = false,
"   env_file = '.env',
"   yank_dry_run = true,
" })
" EOF


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

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
		i = {
			["<C-j>"] = actions.move_selection_next,
			["<C-k>"] = actions.move_selection_previous,
			["<Down>"] = actions.move_selection_next,
			["<Up>"] = actions.move_selection_previous,
			["<C-s>"] = actions.select_horizontal,
			},
		n = {
			["<C-s>"] = actions.select_horizontal,
			},
    }
  }
})
EOF

lua <<EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

lua <<EOF
require('tabout').setup {
    tabkey = '¬', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '˙', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}
EOF


  " ensure_installed = "maintained",
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ignore_install = { "" },
  highlight = {
	enable = true,
	disable = { "" },
	additional_vim_regex_highlighting = true,
  },
  refactor = {
        highlight_definitions = { enable = true },
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
  chars = {
	  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  },
  -- A group to use for overwriting the Normal highlight group in the floating
  -- window. This can be used to change the background color.
  normal_hl = 'BlackOnLightYellow', -- 'BlackOnLightYellow', -- IncSearch(yellow), StatusLine, error(red)


  -- The highlight group to apply to the line that contains the hint characters.
  -- This is used to make them stand out more.
  hint_hl = 'Bold',

  -- The border style to use for the floating window.
  border = 'none'
})
EOF
lua <<EOF
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}
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
" npairs.setup({e=dropdown
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
set cursorline
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
set relativenumber
"set nocompatible
set ignorecase
colorscheme jellybeans
set encoding=utf-8
set termencoding=utf-8
set tags=./tags;,tags;,../tags;,../../tags;,../../../tags;,../../../../tags;
set laststatus=2
set splitright
set splitbelow
set noshowcmd
set linebreak
set showbreak=--\
"set autoindent
"set list listchars=tab:·\ ,eol:$ "마지막 라인에 $표시
"set tags=./tags,tags
"set clipboard=unnamed
"set showmatch

" key-setting

noremap Q <Nop>
noremap s <nop>
noremap S <nop>
noremap <silent>QQ :q!<cr>
noremap <silent>ㅃㅃ :q!<cr>
noremap <silent>W :w!<cr>

" noremap <silent>fz v]}zf
" noremap <silent>fo zo
noremap <silent>M :nohl<CR>

" Start Win-Move mode:
nnoremap <C-W>m <Cmd>WinShift<CR>

" nmap <silent> ˙ <Plug>(sexp_swap_element_backward)
" xmap <silent> ˙ <Plug>(sexp_swap_element_backward)
" nmap <silent> ¬ <Plug>(sexp_swap_element_forward)
" xmap <silent> ¬ <Plug>(sexp_swap_element_forward)
" nmap <silent> ( <Plug>(sexp_move_to_prev_bracket)
" xmap <silent> ( <Plug>(sexp_move_to_prev_bracket)
" omap <silent> ( <Plug>(sexp_move_to_prev_bracket)
" nmap <silent> ) <Plug>(sexp_move_to_next_bracket)
" xmap <silent> ) <Plug>(sexp_move_to_next_bracket)
" omap <silent> ) <Plug>(sexp_move_to_next_bracket)

map <silent> <leader><C-w> :lua require('nvim-window').pick()<CR>
" nnoremap <C-j><Plug>RestNvim :lua require('rest-nvim').run()<CR>
" nnoremap <Plug>RestNvimPreview :lua require('rest-nvim').run(true)<CR>
" nnoremap <Plug>RestNvimLast :lua require('rest-nvim').last()<CR>


vnoremap y y`>
vnoremap Y Y`>
noremap p p`]
"nnoremap <C-w> <C-w>w

" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
inoremap <C-g> <C-o>x

cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>


" line copy
nnoremap <silent> :t -<CR>==
nnoremap <silent>Ô :t .<CR>==


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
inoremap <silent> <Esc>:t -<CR>==gi
inoremap <silent>Ô <Esc>:t .<CR>==gi


" option shift j

" moving line

nnoremap <silent>˚ :m .-2<CR>==
nnoremap <silent>∆ :m .+1<CR>==
inoremap <silent>˚ <Esc>:m .-2<CR>==gi
inoremap <silent>∆ <Esc>:m .+1<CR>==gi
vnoremap <silent>˚ :m '<-2<CR>gv=gv
vnoremap <silent>∆ :m '>+1<CR>gv=gv



" nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" nnoremap <leader>t :Tagbar<CR>
" nnoremap <C-j> :lua require('rest-nvim').run()<CR>
" nmap <C-j> <Plug>RestNvim

nnoremap <leader>n :NvimTreeToggle<CR>
"nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>pp :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" noremap <silent><leader>q :bp<cr>
" noremap <silent><leader>d :bd!<cr>
" noremap <silent><leader>w :bn<cr>
"
nnoremap <silent><Up>    :resize -2<CR>
nnoremap <silent><Down>  :resize +2<CR>
nnoremap <silent><Left>  :vertical resize -2<CR>
nnoremap <silent><Right> :vertical resize +2<CR>
" nnoremap <silent>fp :!python3 % < input.txt > output.txt<CR>
" nnoremap <silent>+ :vert res +2<CR>
" nnoremap <silent>_ :vert res -2<CR>

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

nnoremap <leader>ff <cmd>Telescope find_files theme=dropdown prompt_prefix=🔍ㅤ <cr>
nnoremap <leader>fs <cmd>Telescope live_grep theme=dropdown prompt_prefix=🔍ㅤ <cr>
" nnoremap <leader>fb <cmd>Telescope buffers theme=dropdown prompt_prefix=🔍ㅤ <cr>
nnoremap <leader>fh <cmd>Telescope help_tags theme=dropdown prompt_prefix=🔍ㅤ <cr>
nnoremap <leader>fc <cmd>Telescope git_commits theme=dropdown prompt_prefix=🔍ㅤ <cr>
nnoremap <leader>t <cmd>Telescope<cr>
nnoremap <leader>c <cmd>Telescope coc<cr>
nnoremap <leader>fb <cmd>Telescope file_browser theme=dropdown prompt_prefix=🔍ㅤ <cr>
nnoremap <leader>gr <cmd>Telescope coc references theme=dropdown prompt_prefix=🔍ㅤ <cr>
nnoremap <leader>gd <cmd>Telescope coc definitions theme=dropdown prompt_prefix=🔍ㅤ <cr>

" nnoremap <leader>ff :Files<CR>
" nnoremap <leader>fs :Rg<CR>
" nnoremap <leader>fb :Buffers<CR>
" nnoremap <leader>fc :Commits<CR> 

nnoremap <silent><leader>s :HopChar1<CR>
" map <leader>s <Plug>(easymotion-overwin-f)
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
" Some servers have issues with backup files, see.
set nobackup
set noswapfile
set nowritebackup

set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set shortmess+=I

" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <C-k> <C-p>
" inoremap <C-j> <C-n>

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
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent><leader>fi <Plug>(coc-fix-current)
nnoremap <silent><leader>z :ZenMode<CR>

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


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)


xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
094
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>ra  <Plug>(coc-refactor)

" multi cursor shortcuts
" nmap <silent> <C-a> <Plug>(coc-cursors-word)
" xmap <silent> <C-a> <Plug>(coc-cursors-range

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
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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


""" ======== 자동화 ========

inoreabbrev console console
inoreabbrev consloe console
inoreabbrev consoel console
inoreabbrev ture true
inoreabbrev Ture True
inoreabbrev treu true
inoreabbrev Treu True
inoreabbrev imt int
inoreabbrev itn int
inoreabbrev coment comment
cnoreabbrev sourec source
cnoreabbrev sorce source
cnoreabbrev sourec source
cnoreabbrev sorec source
cnoreabbrev soruce source
cnoreabbrev souce source
cnoreabbrev sourc source

au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

function PythonOpen()
	:bo 32vs input.txt
	:sp output.txt
	:wincmd h
endfunction

function TxtOpen()
	:CocDisable
	" :Copilot disable
endfunction

function EnterPython()
	:CocEnable
endfunction

function EnterTxt()
	:CocDisable
endfunction
":execute "normal! \<C-w>l"
function PythonRun()
	:1windo !python3 % < input.txt > output.txt
endfunction

" nnoremap <silent>fo exec Func()
autocmd FileType python
			\ nnoremap <silent>rp :call PythonRun()<CR>
			" \ nnoremap <silent>rp :silent 1windo !python3 % < input.txt > output.txt<CR>
" 경고창 방지로 silent
autocmd FileType python
			\ nnoremap <silent>rw :exec PythonOpen()<CR> |
			\ inoreabbrev pirnt print
autocmd VimEnter *.py
			\ exec PythonOpen()
autocmd VimEnter *.txt
			\ exec TxtOpen()

autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 tabstop=2 
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 

" autocmd BufWinEnter *.txt
" 			\ exec EnterTxt()
" autocmd WinEnter *.py
" 			\ exec EnterPython()


" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType html,css,ejs,pug EmmetInstall
autocmd BufNewFile,BufRead *.ejs set filetype=html

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"autocmd User TelescopePreviewerLoaded setlocal wrap
source ~/.config/nvim/after/colors/solarized.vim
