return {
  "VonHeikemen/lsp-zero.nvim",

  config = function()
    require("lsp-zero")
    require("lspconfig").intelephense.setup({})
  end,
}
