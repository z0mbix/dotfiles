require "nvchad.autocmds"

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("BufDelete", {
  group = augroup "show_dashboard_on_last_buffer_close",
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})


-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "PlenaryTestPopup",
    "codecompanion",
    "checkhealth",
    "grug-far",
    "grug-far-results",
    "grug-far-history",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
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
    vim.keymap.set("n", "q", "<cmd>quitall<cr>", { buffer = event.buf, silent = true })
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

-- Open dashboard or telescope on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup "telescope_open",
  desc = "open dashboard or telescope on startup",
  pattern = "*",
  callback = function()
    if vim.fn.argc() ~= 0 then
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

    -- Open telescope
    if vim.fn.isdirectory ".git" ~= 0 then
      vim.cmd "Telescope git_files"
    else
      vim.cmd "Telescope find_files"
    end
  end,
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
    rc = "sh",
    repo = "yum",
  },
  filename = {
    [".envrc"] = "sh",
    Jenkinsfile = "jenkinsfile",
    ["nats.conf"] = "hocon",
    [vim.fn.expand "~/.kube/config"] = "yaml",
  },
  pattern = {
    [vim.pesc(vim.fn.expand "~") .. "/%.sh/.*"] = "sh",
    [".*/%.ssh/config%..+"] = "sshconfig",
    ["nats.*%.conf"] = "hocon",
    ["Jenkinsfile.*"] = "jenkinsfile",
    [".*%.Jenkinsfile"] = "jenkinsfile",
    [".*%.json%.j2"] = "json",
    [".*%.code%-workspace"] = "json",
    [".*%.tfstate"] = "json",
    [".*%.ya?ml%.j2"] = "yaml",
    [".*%.repo%.j2"] = "yum",
    [".*%.Makefile"] = "make",
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
