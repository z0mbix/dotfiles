local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

return require('packer').startup(function()

	use 'RRethy/vim-illuminate'
	use 'alexaandru/nvim-lspupdate'
	use 'andymass/vim-matchup'
	use 'b3nj5m1n/kommentary'
	use 'bogado/file-line'
	use 'cappyzawa/trim.nvim'
	use 'christianchiarulli/nvcode-color-schemes.vim'
	use 'danro/rename.vim'
	use 'dense-analysis/ale'
	use 'f-person/git-blame.nvim'
	use 'folke/zen-mode.nvim'
	use 'ggandor/lightspeed.nvim'
	use 'hoob3rt/lualine.nvim'
	use 'hrsh7th/nvim-compe'
	use 'jeffkreeftmeijer/vim-numbertoggle'
	use 'junegunn/limelight.vim'
	use 'junegunn/rainbow_parentheses.vim'
	use 'junegunn/vim-after-object'
	use 'junegunn/vim-easy-align'
	use 'junegunn/vim-peekaboo'
	use 'kana/vim-submode'
	use 'kevinhwang91/nvim-bqf'
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
	use 'sindrets/diffview.nvim'
	use 'tpope/vim-surround'
	use 'wbthomason/packer.nvim'
	use 'wellle/targets.vim'
	use 'windwp/nvim-autopairs'

	use { 'ekalinin/Dockerfile.vim', ft = 'Dockerfile' }
	use { 'elzr/vim-json', ft = 'json' }
	use { 'hashivim/vim-packer', ft = { 'hcl', 'json'} }
	use { 'hashivim/vim-terraform', ft = { 'hcl', 'terraform'} }
	use { 'henrik/vim-reveal-in-finder', cond = "vim.fn.has('mac') == 1" }
	use { 'kdheepak/lazygit.nvim', cond = "vim.fn.executable('lazygit')"}
	use { 'leafgarland/typescript-vim', ft = 'typescript' }
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = "vim.fn.executable('fzf')" }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'pearofducks/ansible-vim', ft = 'ansible' }
	use { 'z0mbix/vim-shfmt', ft = 'sh' }

end)
