-- https://github.com/ya2s/nvim-cursorline
return {
  "ya2s/nvim-cursorline",
  config = function()
    require("nvim-cursorword").setup({
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    })
  end,
}
