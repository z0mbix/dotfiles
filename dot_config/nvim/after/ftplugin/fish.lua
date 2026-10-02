vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

local undo = vim.b.undo_ftplugin
vim.b.undo_ftplugin = (undo and undo ~= "" and undo .. " | " or "") .. "setlocal tabstop< shiftwidth<"
