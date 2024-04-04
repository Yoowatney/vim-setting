call plug#begin('~/.config/nvim/plugged')
" utils
Plug 'pbondoer/vim-42header'
Plug 'moll/vim-node'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-telescope/telescope.nvim', { 'commit' : '39b12d84e86f5054e2ed98829b367598ae53ab41'}
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'phaazon/hop.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tommcdo/vim-exchange'
Plug 'akinsho/toggleterm.nvim'
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'sindrets/winshift.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-speeddating'
" TODO Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'Pocco81/AbbrevMan.nvim'
Plug 'Pocco81/TrueZen.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'anuvyklack/pretty-fold.nvim'
Plug 'anuvyklack/nvim-keymap-amend'
Plug 'junegunn/vim-emoji'
Plug 'rhysd/vim-clang-format'


" Plug 'abecodes/tabout.nvim'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" debug
" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
" Plug 'puremourning/vimspector'

" readability
Plug 'RRethy/vim-illuminate'
Plug 'pangloss/vim-javascript'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'p00f/nvim-ts-rainbow'
Plug 'nanotech/jellybeans.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'glepnir/zephyr-nvim'
Plug 'novakne/kosmikoa.nvim'

" Plug 'sheerun/vim-polyglot'
" Plug 'Yggdroot/indentline'
"Plug 'dracula/vim'
" Plug 'morhetz/gruvbox'
"Plug 'roosta/srcery'

"auto complete
" Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'relastle/vim-nayvy'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'windwp/nvim-autopairs'
Plug 'roxma/nvim-yarp'
Plug 'github/copilot.vim'
Plug 'gelguy/wilder.nvim'

" Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'onsails/lspkind-nvim'
" Plug 'jose-elias-alvarez/null-ls.nvim'
"
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'

"Plug 'vim-syntastic/syntastic'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'shougo/neocomplcache.vim'
"Plug 'valloric/youcompleteme'
call plug#end()
