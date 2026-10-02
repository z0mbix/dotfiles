vim.bo.textwidth = 160

local undo = vim.b.undo_ftplugin
vim.b.undo_ftplugin = (undo and undo ~= "" and undo .. " | " or "") .. "setlocal textwidth<"
