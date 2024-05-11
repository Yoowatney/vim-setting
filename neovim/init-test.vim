call plug#begin('~/.config/nvim/plugged')
" utils
" Plug 'pbondoer/vim-42header'
Plug 'moll/vim-node'
Plug 'tpope/vim-surround', { 'commit' : 'ede047791792b9530ba1ae73ed86e9671cdd96b8' }
Plug 'nvim-lua/plenary.nvim', { 'commit' : '0a907364b5cd6e3438e230df7add8b9bb5ef6fd3' }
Plug 'sindrets/diffview.nvim', { 'commit' : '7e5a85c186027cab1e825d018f07c350177077fc' }
Plug 'nvim-lua/popup.nvim', { 'commit' : 'b7404d35d5d3548a82149238289fa71f7f6de4ac' }
Plug 'ryanoasis/vim-devicons', { 'commit' : 'a2258658661e42dd4cdba4958805dbad1fe29ef4' }
Plug 'nvim-telescope/telescope.nvim', { 'commit' : '39b12d84e86f5054e2ed98829b367598ae53ab41'}
Plug 'fannheyward/telescope-coc.nvim', { 'commit' : 'e5c3c4855a0bb6859975209a480dc830ea802540' }
Plug 'nvim-telescope/telescope-file-browser.nvim', { 'commit' : '28e75f6cdb63b4903035c8db2845aaddb89f1610' }
Plug 'christoomey/vim-tmux-navigator', { 'commit' : '9ca5bfe5bd274051b5dd796cc150348afc993b80' }
Plug 'phaazon/hop.nvim', { 'commit' : 'b93ed4cea9c7df625d04e41cb15370b5c43cb578' }
Plug 'kyazdani42/nvim-tree.lua', { 'commit' : 'f8312cd06fbbf4e3091e8148e8a4e57fbed30860' }
Plug 'nvim-lualine/lualine.nvim', { 'commit' : 'a4e4517ac32441dd92ba869944741f0b5f468531' }
Plug 'mg979/vim-visual-multi', { 'commit': '046d0d5ac5fb2888447d1dd8b7e52fd0314f9766' }
Plug 'tommcdo/vim-exchange', { 'commit' : '784d63083ad7d613aa96f00021cd0dfb126a781a' }
Plug 'akinsho/toggleterm.nvim', { 'commit' : '9f969e7f72d19966756318d61f2562f67dbb1f9c' }
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git', {'commit' : 'dd0a6b230003ef35524853d71e5413f88fd2ba74' }
Plug 'honza/vim-snippets', { 'commit' : '6f270bb2d26c38765ff2243e9337c65f8a96a28b' }
Plug 'SirVer/ultisnips', { 'commit' : 'f5ccf0977c611ffd774ca180774959301baaffad' }
Plug 'kyazdani42/nvim-web-devicons', { 'commit' : '53dc7b388ba84a14e40a6ab2d4c22972d81292ad' }
Plug 'akinsho/bufferline.nvim', { 'commit' : 'b2a0691df8a51a7590122aef456db1d70445647d' }
Plug 'sindrets/winshift.nvim', { 'commit' : 'aaa04b97640165eb0877bfc04943f4282887470b' }
Plug 'numToStr/Comment.nvim', { 'commit' : '40f5587789681b3453e4a27831b7d293e1c3da7b' }
Plug 'tpope/vim-speeddating', { 'commit' : '95da3d72efc91a5131acf388eafa4b1ad6512a9b' }
" TODO Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } 02cc3874738bc0f86e4b91f09b8a0ac88aef8e96
Plug 'sudormrfbin/cheatsheet.nvim', { 'commit' : '' }
Plug 'Pocco81/AbbrevMan.nvim', { 'commit' : '97b40b51b373d0d1c22f71dd8fce7f61f6bf46a5' }
Plug 'Pocco81/TrueZen.nvim', { 'commit' : '508b977d71650da5c9243698614a9a1416f116d4' }
Plug 'norcalli/nvim-colorizer.lua', { 'commit' : '' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }, { 'commit' : '' }
Plug 'anuvyklack/pretty-fold.nvim', { 'commit' : 'e6385d62eec67fdc8a21700b42a701d0d6fb8b32' }
Plug 'anuvyklack/nvim-keymap-amend', { 'commit' : '' }
Plug 'junegunn/vim-emoji', { 'commit' : '' }
Plug 'rhysd/vim-clang-format', { 'commit' : '' }


" Plug 'abecodes/tabout.nvim'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" git
Plug 'lewis6991/gitsigns.nvim', { 'commit' : 'ffd06e36f6067935d8cb9793905dd2e84e291310' }
Plug 'tpope/vim-fugitive', { 'commit' : '' }

" debug
" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
" Plug 'puremourning/vimspector'

" readability
Plug 'RRethy/vim-illuminate', { 'commit' : '' }
Plug 'pangloss/vim-javascript', { 'commit' : '' }
Plug 'lukas-reineke/indent-blankline.nvim', { 'commit' : '8567ac8ccd19ee41a6ec55bf044884799fa3f56b' }
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'p00f/nvim-ts-rainbow'
Plug 'nanotech/jellybeans.vim', { 'commit' : '' }
Plug 'projekt0n/github-nvim-theme', { 'commit' : '' }
Plug 'glepnir/zephyr-nvim', { 'commit' : '' }
Plug 'novakne/kosmikoa.nvim', { 'commit' : '' }

" Plug 'sheerun/vim-polyglot'
" Plug 'Yggdroot/indentline'
"Plug 'dracula/vim'
" Plug 'morhetz/gruvbox'
"Plug 'roosta/srcery'

"auto complete
" Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}, { 'commit' : '' }
Plug 'relastle/vim-nayvy', { 'commit' : '' }
Plug 'mattn/emmet-vim', { 'commit' : '' }
Plug 'tpope/vim-repeat', { 'commit' : '' }
Plug 'windwp/nvim-autopairs', { 'commit' : '' }
Plug 'roxma/nvim-yarp', { 'commit' : '' }
Plug 'github/copilot.vim', { 'commit' : '' }
Plug 'gelguy/wilder.nvim', { 'commit' : '777b163e394ba658ef288292efb533b25610ef9d' }

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
