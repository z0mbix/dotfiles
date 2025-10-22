-- plugin/reveal.lua (autoloaded)  ── or ──  lua/reveal/init.lua + require('reveal').setup()
local M = {}

-- local function is_macos()
--   return vim.loop.os_uname().sysname == "Darwin"
-- end

local function is_macos()
  return vim.fn.has "mac" == 1
end

local function opener_and_args_for_dir(dir)
  if is_macos() then
    return { "open", dir }
  end
  if vim.fn.has "win32" == 1 or vim.fn.has "win64" == 1 then
    return { "explorer", dir }
  end
  return { "xdg-open", dir }
end

local function reveal_path_in_finder(path)
  -- use argument vector form to avoid shell escaping
  if is_macos() then
    return { "open", "-R", path }
  end
  -- non-mac fallback: just open the containing directory
  local dir = vim.fn.fnamemodify(path, ":p:h")
  return opener_and_args_for_dir(dir)
end

function M.reveal_in_finder()
  local abs = vim.fn.expand "%:p" -- absolute path (may be empty for [No Name])
  local is_file = (abs ~= "") and (vim.fn.filereadable(abs) == 1)
  local parent_dir = vim.fn.fnamemodify(abs, ":p:h")
  local is_parent_dir = (parent_dir ~= "") and (vim.fn.getftype(parent_dir) == "dir")

  local cmd
  if is_file then
    cmd = reveal_path_in_finder(abs)
  elseif is_parent_dir then
    cmd = opener_and_args_for_dir(parent_dir)
  else
    cmd = opener_and_args_for_dir "."
  end

  -- fire-and-forget so the UI doesn’t block
  vim.fn.jobstart(cmd, { detach = true })
  vim.cmd.redraw() -- keep terminal ui tidy, like :redraw!
end

function M.setup()
  vim.api.nvim_create_user_command("Reveal", function()
    M.reveal_in_finder()
  end, {})
end

-- if this file lives in plugin/, auto-register the command:
-- if ... == nil or ...:match("^plugin[./]") then
--   M.setup()
-- end

return M
