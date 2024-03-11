local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

return require("packer").startup(function(use)
  use("HiPhish/rainbow-delimiters.nvim")
  use("NoahTheDuke/vim-just")
  use("Shatur/neovim-ayu")
  use("YacineDo/mc.nvim")
  use("alexaandru/nvim-lspupdate")
  use("andymass/vim-matchup")
  use("axieax/urlview.nvim")
  use("bogado/file-line")
  use("cappyzawa/trim.nvim")
  use("chentoast/marks.nvim")
  use("christianchiarulli/nvcode-color-schemes.vim")
  use("christoomey/vim-tmux-navigator")
  use("ckipp01/stylua-nvim")
  use("danilamihailov/beacon.nvim")
  use("danro/rename.vim")
  use("debugloop/telescope-undo.nvim")
  use("ellisonleao/glow.nvim")
  use("f-person/git-blame.nvim")
  use("fatih/vim-go")
  use("filipdutescu/renamer.nvim")
  use("folke/neodev.nvim")
  use("folke/trouble.nvim")
  use("folke/twilight.nvim")
  use("folke/which-key.nvim")
  use("folke/zen-mode.nvim")
  use("gbprod/yanky.nvim")
  use("golang/vscode-go")
  use("hoob3rt/lualine.nvim")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/vim-vsnip")
  use("jose-elias-alvarez/null-ls.nvim")
  use("junegunn/limelight.vim")
  use("junegunn/vim-after-object")
  use("junegunn/vim-easy-align")
  use("junegunn/vim-peekaboo")
  use("kana/vim-submode")
  use("kevinhwang91/nvim-bqf")
  use("kyazdani42/nvim-web-devicons")
  use("loctvl842/monokai-pro.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("machakann/vim-highlightedyank")
  use("mbbill/undotree")
  use("mfussenegger/nvim-lint")
  use("mg979/vim-visual-multi")
  use("michaeljsmith/vim-indent-object")
  use("mrjones2014/smart-splits.nvim")
  use("neovim/nvim-lspconfig")
  use("norcalli/nvim-colorizer.lua")
  use("numToStr/Comment.nvim")
  use("numtostr/FTerm.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-treesitter/playground")
  use("ojroques/nvim-bufdel")
  use("sindrets/diffview.nvim")
  use("szw/vim-maximizer")
  use("towolf/vim-helm")
  use("ur4ltz/move.nvim")
  use("ur4ltz/surround.nvim")
  use("wbthomason/packer.nvim")
  use("wellle/targets.vim")
  use("wfxr/minimap.vim")
  use("windwp/nvim-autopairs")
  use("zbirenbaum/copilot.lua")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.api.nvim_command, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" }, -- Required
    },
  })

  -- TODO: Required neovim >= 0.10
  -- use('Bekaboo/dropbar.nvim')

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "s1n7ax/nvim-window-picker",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })

  use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
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
