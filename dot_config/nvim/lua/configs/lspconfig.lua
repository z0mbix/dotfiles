require("nvchad.configs.lspconfig").defaults()

-- mason-lspconfig auto-installs these via Mason and teaches lspconfig where to find them.
-- keep this list in sync with the ensure_installed list in lua/plugins/init.lua.
local servers = {
  "bashls",       -- bash-language-server
  "cssls",        -- vscode-css-language-server
  "gopls",        -- go
  "html",         -- vscode-html-language-server
  "lua_ls",       -- lua-language-server
  "pyright",      -- python
  "terraformls",  -- terraform
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

