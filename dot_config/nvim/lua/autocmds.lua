require "nvchad.autocmds"

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup "auto_create_dir",
  callback = function(event)
    if event.match:match "^%w%w+:[\\/][\\/]" then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "grug-far",
    "grug-far-results",
    "grug-far-history",
    "help",
    "lspinfo",
    "man",
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

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local orig_notify = vim.notify
    vim.notify = function(msg, ...)
      if type(msg) == "string" and msg:match 'not found in runtime path: "queries/' then
        return
      end
      return orig_notify(msg, ...)
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "remember location in the file",
  pattern = "*",
  callback = function()
    local line = vim.fn.line
    if line "'\"" > 0 and line "'\"" <= line "$" then
      vim.cmd "normal! g'\""
    end
  end,
})

local telescope_open = vim.api.nvim_create_augroup("telescope_open", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "open telescope on startup",
  pattern = "*",
  group = telescope_open,
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end

    local ft = vim.bo.filetype
    if ft == "man" then
      return
    end

    if vim.fn.getcwd() == vim.fn.expand "~" then
      return
    end

    -- Check for session file first
    local cwd = vim.fn.getcwd()
    local session_name = cwd:gsub("/", "%%") .. ".vim"
    local session_path = vim.fn.stdpath "data" .. "/sessions/" .. session_name

    -- Load session if it exists
    if vim.fn.filereadable(session_path) == 1 then
      -- require("persistence").load()
      return
    else
      -- No session found, open telescope
      if vim.fn.isdirectory ".git" ~= 0 then
        vim.cmd "Telescope git_files"
      else
        vim.cmd "Telescope find_files"
      end
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  desc = "configure relative line numbers",
  pattern = "*",
  callback = function()
    if vim.wo.number and vim.api.nvim_get_mode().mode ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  desc = "configure line numbers",
  pattern = "*",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "create new file and all directories",
  pattern = "*",
  callback = function()
    local file_dir = vim.fn.expand "<afile>:p:h"
    if not vim.loop.fs_stat(file_dir) then
      vim.fn.mkdir(file_dir, "p")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "configure git commit file type",
  pattern = "gitcommit",
  callback = function()
    vim.bo.textwidth = 72
    vim.bo.colorcolumn = "73"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  desc = "set file type for posix shell scripts",
  pattern = { "*.rc", "*.sh", ".envrc", "~/.sh/*" },
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set fish shell script file type settings",
  pattern = { "fish" },
  callback = function()
    vim.bo.filetype = "fish"
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
    vim.bo.smartindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set posix shell script file type settings",
  pattern = "sh",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.smartindent = true
  end,
})

local filetype_settings = {
  { pattern = { "*.rake", "*.ru", ".irbrc", ".pryrc", "Gemfile", "Rakefile", "Vagrantfile" }, ft = "ruby" },
  { pattern = { "*.erb" }, ft = "eruby" },
  { pattern = { "*.php" }, ft = "php" },
  { pattern = { "*.py" }, ft = "python" },
  { pattern = { "*.js" }, ft = "javascript" },
  { pattern = { "*.ts" }, ft = "typescript" },
  { pattern = { "*.json", "*.json.j2", "*.code-workspace", "*.tfstate" }, ft = "json" },
  { pattern = { "~/.kube/config", "*.yaml", "*.yml.j2", "*.yaml.j2", "*.yml.j2" }, ft = "yaml" },
  { pattern = { "*.Jenkinsfile", "Jenkinsfile", "Jenkinsfile*" }, ft = "jenkinsfile" },
  { pattern = { "*.repo", "*.repo.j2" }, ft = "yum" },
  { pattern = { "*.hcl" }, ft = "hcl" },
  { pattern = { "make", "*.Makefile" }, ft = "make" },
}

for _, setting in pairs(filetype_settings) do
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = setting.pattern,
    callback = function()
      vim.bo.filetype = setting.ft
    end,
  })
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  desc = "nats configuration files",
  group = vim.api.nvim_create_augroup("hocon", { clear = true }),
  pattern = { "nats.conf", "nats*.conf" },
  command = "set ft=hocon",
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set ruby file type settings",
  pattern = "ruby,eruby",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.textwidth = 79
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
    vim.bo.smartindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set python file type settings",
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.textwidth = 160
    vim.bo.expandtab = true
    vim.bo.softtabstop = 4
    vim.bo.smartindent = true
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set javascript and typesscript file type settings",
  pattern = "javascript,typescript",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.textwidth = 120
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
    vim.bo.smartindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set json file type settings",
  pattern = "json",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
    vim.bo.smartindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set yaml file type settings",
  pattern = "yaml",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
    vim.bo.smartindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "set make, c and c++ file type settings",
  pattern = "make,c,cpp",
  callback = function()
    vim.bo.tabstop = 8
    vim.bo.shiftwidth = 8
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "strip trailing whitespace before saving",
  pattern = "*",
  callback = function()
    vim.cmd "%s/\\s\\+$//e"
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   desc = "reload neovim config after saving",
--   pattern = { "lua/*.lua", "lua/plugins/*.lua", "init.lua" },
--   callback = function()
--     vim.cmd "source $MYVIMRC"
--   end,
-- })

vim.api.nvim_create_autocmd("VimResized", {
  desc = "resize windows equally",
  pattern = "*",
  callback = function()
    vim.cmd "wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  desc = "ignore viminfo for git",
  pattern = "*.git/*",
  callback = function()
    vim.fn.setpos(".", { 0, 1, 1, 0 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "disable auto comment new line",
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove "c"
    vim.opt_local.formatoptions:remove "r"
    vim.opt_local.formatoptions:remove "o"
    vim.opt_local.formatoptions:append "j"
  end,
})
