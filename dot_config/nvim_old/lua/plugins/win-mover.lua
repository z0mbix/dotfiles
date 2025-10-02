-- https://github.com/ycdzj/win-mover.nvim
return {
  "ycdzj/win-mover.nvim",
  config = function()
    local win_mover = require("win-mover")
    win_mover.setup({
      ignore = {
        enable = true,
        filetypes = { "minimap", "neo-tree", "toggleterm" },
      },
      move_mode = {
        keymap = {
          h = win_mover.ops.move_left,
          j = win_mover.ops.move_down,
          k = win_mover.ops.move_up,
          l = win_mover.ops.move_right,

          H = win_mover.ops.move_far_left,
          J = win_mover.ops.move_far_down,
          K = win_mover.ops.move_far_up,
          L = win_mover.ops.move_far_right,

          q = win_mover.ops.quit,
          ["<Esc>"] = win_mover.ops.quit,
        },
      },
    })
  end,
}
