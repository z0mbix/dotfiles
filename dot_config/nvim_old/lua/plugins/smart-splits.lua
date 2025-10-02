-- https://github.com/mrjones2014/smart-splits.nvim
return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      ignored_buftypes = {
        "neo-tree",
        "neo-tree-popup",
        "notify",
      },
    })
  end,
}
