local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

return require("packer").startup(function(use)
  use({ "plugin" })
  use("NoahTheDuke/vim-just")
  use("alexaandru/nvim-lspupdate")
  use("andymass/vim-matchup")
  use("b3nj5m1n/kommentary")
  use("bogado/file-line")
  use("cappyzawa/trim.nvim")
  use("christianchiarulli/nvcode-color-schemes.vim")
  use("ckipp01/stylua-nvim")
  use("danilamihailov/beacon.nvim")
  use("danro/rename.vim")
  use("dense-analysis/ale")
  use("ellisonleao/glow.nvim")
  use("f-person/git-blame.nvim")
  use("fatih/vim-go")
  use("folke/trouble.nvim")
  use("folke/twilight.nvim")
  use("folke/which-key.nvim")
  use("folke/zen-mode.nvim")
  use("golang/vscode-go")
  use("gpanders/editorconfig.nvim")
  use("hoob3rt/lualine.nvim")
  use("hrsh7th/nvim-compe")
  use("hrsh7th/vim-vsnip")
  use("https://gitlab.com/__tpb/monokai-pro.nvim")
  use("junegunn/limelight.vim")
  use("junegunn/vim-after-object")
  use("junegunn/vim-easy-align")
  use("junegunn/vim-peekaboo")
  use("kana/vim-submode")
  use("kdheepak/lazygit.nvim")
  use("kevinhwang91/nvim-bqf")
  use("kyazdani42/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")
  use("lukas-reineke/indent-blankline.nvim")
  use("machakann/vim-highlightedyank")
  use("mbbill/undotree")
  use("mfussenegger/nvim-lint")
  use("mg979/vim-visual-multi")
  use("michaeljsmith/vim-indent-object")
  use("neovim/nvim-lspconfig")
  use("norcalli/nvim-colorizer.lua")
  use("numtostr/FTerm.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-treesitter/playground")
  use("romgrk/barbar.nvim")
  use("sindrets/diffview.nvim")
  use("szw/vim-maximizer")
  use("towolf/vim-helm")
  use("ur4ltz/surround.nvim")
  use("wbthomason/packer.nvim")
  use("wellle/targets.vim")
  use("wfxr/minimap.vim")
  use("windwp/nvim-autopairs")

  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "ekalinin/Dockerfile.vim", ft = "Dockerfile" })
  use({ "elzr/vim-json", ft = "json" })
  use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "hashivim/vim-packer", ft = { "hcl", "json" } })
  use({ "hashivim/vim-terraform", ft = { "hcl", "terraform" } })
  use({ "henrik/vim-reveal-in-finder", cond = 'vim.fn.has("mac") == 1' })
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
  use({ "leafgarland/typescript-vim", ft = "typescript" })
  use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "m-demare/hlargs.nvim", requires = "nvim-treesitter/nvim-treesitter" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter" })
  use({ "pearofducks/ansible-vim", ft = "ansible" })
end)
