local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

return require('packer').startup(function()
	use 'andymass/vim-matchup'
	use 'kevinhwang91/nvim-bqf'
  use 'windwp/nvim-autopairs'
	use 'jeffkreeftmeijer/vim-numbertoggle'
	use 'RRethy/vim-illuminate'
	use 'b3nj5m1n/kommentary'
	use 'bogado/file-line'
	use 'cappyzawa/trim.nvim'
	use 'christianchiarulli/nvcode-color-schemes.vim'
	use 'danro/rename.vim'
	use 'dense-analysis/ale'
	use 'ggandor/lightspeed.nvim'
	use 'hoob3rt/lualine.nvim'
	use 'hrsh7th/nvim-compe'
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'
	use 'junegunn/rainbow_parentheses.vim'
	use 'junegunn/vim-after-object'
	use 'junegunn/vim-easy-align'
	use 'junegunn/vim-peekaboo'
	use 'kana/vim-submode'
	use 'kdheepak/lazygit.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'machakann/vim-highlightedyank'
	use 'mbbill/undotree'
	use 'mfussenegger/nvim-lint'
	use 'mg979/vim-visual-multi'
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-treesitter/playground'
	use 'romgrk/barbar.nvim'
	use 'tpope/vim-surround'
	use 'wbthomason/packer.nvim'
	use 'wellle/targets.vim'
	use { 'ekalinin/Dockerfile.vim', ft = 'Dockerfile' }
	use { 'elzr/vim-json', ft = 'json' }
	use { 'hashivim/vim-packer', ft = 'json' }
	use { 'hashivim/vim-terraform', ft = 'terraform' }
	use { 'leafgarland/typescript-vim', ft = 'typescript' }
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'pearofducks/ansible-vim', ft = 'ansible' }
	use { 'z0mbix/vim-shfmt', ft = 'sh' }
end)
