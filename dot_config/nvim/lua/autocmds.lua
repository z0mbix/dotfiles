require "nvchad.autocmds"

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("BufDelete", {
  group = augroup "show_dashboard_on_last_buffer_close",
  callback = function()
    local bufs = vim.t.bufs
    if bufs and #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "checkhealth",
    "grug-far",
    "grug-far-results",
    "grug-far-history",
    "help",
    "qf",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Close man pages with <q> (quits Neovim, since man pages are usually a fullscreen experience)
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_man_with_q",
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", function()
      if #vim.fn.getbufinfo { buflisted = 1 } == 0 then
        vim.cmd "quitall"
      else
        vim.cmd "close"
      end
    end, { buffer = event.buf, silent = true })
  end,
})

-- Remember last location in file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup "remember_last_location",
  desc = "remember location in the file",
  pattern = "*",
  callback = function()
    local line = vim.fn.line
    if line "'\"" > 0 and line "'\"" <= line "$" then
      vim.cmd "normal! g'\""
    end
  end,
})

local function open_file_picker()
  if vim.fs.root(0, ".git") then
    vim.cmd "Telescope git_files"
  else
    vim.cmd "Telescope find_files"
  end
end

local project_picker_pending = false
local project_session_restored = false
vim.api.nvim_create_autocmd("User", {
  group = augroup "telescope_project_switch",
  pattern = { "SessionLoadPost", "SessionSavePost" },
  desc = "open file picker for projects without a saved session",
  callback = function(event)
    local project = package.loaded["neovim-project.project"]
    if vim.v.vim_did_enter == 0 or not project or not project.switching_project then
      return
    end

    if event.match == "SessionLoadPost" then
      project_session_restored = true
    end
    if project_picker_pending then
      return
    end

    local cwd = vim.fn.getcwd()
    project_picker_pending = true
    vim.schedule(function()
      local restored = project_session_restored
      project_session_restored = false
      project_picker_pending = false
      if not restored and vim.fn.getcwd() == cwd then
        open_file_picker()
      end
    end)
  end,
})

-- Open dashboard or telescope on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup "telescope_open",
  desc = "open dashboard or telescope on startup",
  pattern = "*",
  callback = vim.schedule_wrap(function()
    if vim.fn.argc() ~= 0 or vim.g.neovim_project_session_loaded then
      return
    end

    -- Don't open anything for man pages
    local ft = vim.bo.filetype
    if ft == "man" then
      return
    end

    -- Open nvdash if in home directory
    if vim.fn.getcwd() == vim.fn.expand "~" then
      require("nvchad.nvdash").open()
      return
    end

    open_file_picker()
  end),
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = augroup "relativenumber_on",
  desc = "configure relative line numbers",
  pattern = "*",
  callback = function()
    if vim.wo.number and vim.api.nvim_get_mode().mode ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = augroup "relativenumber_off",
  desc = "configure line numbers",
  pattern = "*",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

-- filetype detection for things Neovim doesn't auto-detect natively
-- (*.sh, *.py, *.rb, *.js, *.ts, *.json, *.yaml, *.hcl, Gemfile, etc. are all native)
vim.filetype.add {
  extension = {
    hujson = "jsonc",
    rc = "sh",
    repo = "dosini",
  },
  filename = {
    [".envrc"] = "sh",
    Brewfile = "ruby",
    ["nats.conf"] = "hocon",
    [vim.fn.expand "~/.kube/config"] = "yaml",
  },
  pattern = {
    [vim.pesc(vim.fn.expand "~") .. "/%.sh/.*"] = "sh",
    [".*%.Justfile"] = "just",
    [".*%.justfile"] = "just",
    [".*%.Brewfile"] = "ruby",
    [".*%.Makefile"] = "make",
    [".*%.code%-workspace"] = "json",
    [".*%.fish%.tmpl"] = "fish",
    [".*%.json%..+"] = "json",
    [".*%.repo%.j2"] = "dosini",
    [".*%.tfstate"] = "json",
    [".*%.ya?ml%.j2"] = "yaml",
    [".*/%.ssh/config%..+"] = "sshconfig",
    ["nats.*%.conf"] = "hocon",
  },
}

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup "resize_windows",
  desc = "resize windows equally",
  pattern = "*",
  callback = function()
    vim.cmd "wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup "ignore_git_viminfo",
  desc = "ignore viminfo for git",
  pattern = "*.git/*",
  callback = function()
    vim.fn.setpos(".", { 0, 1, 1, 0 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup "disable_auto_comment",
  desc = "disable auto comment new line",
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove "c"
    vim.opt_local.formatoptions:remove "r"
    vim.opt_local.formatoptions:remove "o"
    vim.opt_local.formatoptions:append "j"
  end,
})

-- Auto-open minimap for files longer than the threshold
-- local minimap_auto_open_threshold = 200
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "BufReadPost" }, {
--   group = augroup "minimap_auto_open",
--   desc = "open minimap for long files",
--   callback = function(args)
--     if vim.bo[args.buf].buftype ~= "" then
--       return
--     end
--     if vim.api.nvim_buf_line_count(args.buf) > minimap_auto_open_threshold then
--       if vim.fn.exists ":Minimap" == 2 then
--         pcall(vim.cmd, "Minimap")
--       end
--     end
--   end,
-- })
