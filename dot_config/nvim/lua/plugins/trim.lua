-- https://github.com/cappyzawa/trim.nvim
return {
  "cappyzawa/trim.nvim",

  config = function()
    require("trim").setup({
      ft_blocklist = { "markdown" },
    })
  end,
}
