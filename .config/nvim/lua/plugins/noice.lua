-- https://github.com/folke/noice.nvim
return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      messages = {
        enabled = false,
        view = "mini",
      },
    })
  end,
}
