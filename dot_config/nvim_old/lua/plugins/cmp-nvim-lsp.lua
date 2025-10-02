-- https://github.com/hrsh7th/cmp-nvim-lsp
return {
  "hrsh7th/cmp-nvim-lsp",
  config = function()
    require("cmp").setup({
      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
}
