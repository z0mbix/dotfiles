local M = {}

local function normal_windows()
  return vim.tbl_filter(function(win)
    return vim.api.nvim_win_get_config(win).relative == ""
  end, vim.api.nvim_tabpage_list_wins(0))
end

function M.toggle()
  if vim.t.maximize_restore then
    vim.cmd(vim.t.maximize_restore)
    vim.t.maximize_restore = nil
  elseif #normal_windows() > 1 then
    vim.t.maximize_restore = vim.fn.winrestcmd()
    vim.cmd.wincmd "|"
    vim.cmd.wincmd "_"
  end
end

return M
