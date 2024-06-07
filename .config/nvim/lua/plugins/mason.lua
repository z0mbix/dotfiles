-- https://github.com/williamboman/mason.nvim
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "golangci_lint_ls",
        "jsonls",
        "ruff",
        "taplo",
        "terraformls",
        "tflint",
        "yamlls",
        "ansiblels",
        "bashls",
        "dockerls",
        "gopls",
        "lua_ls",
      },
    })
  end,
}
