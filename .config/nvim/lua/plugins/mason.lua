-- https://github.com/williamboman/mason.nvim
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup({
      ensure_installed = {
        "gofumpt",
        "hadolint",
        "hclfmt",
        "shellcheck",
        "shfmt",
        "tflint",
      },
    })

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "ansiblels",
        "bashls",
        "dockerls",
        "golangci_lint_ls",
        "gopls",
        "jsonls",
        "lua_ls",
        "ruff",
        "taplo",
        "terraformls",
        "yamlls",
      },
    })
  end,
}
