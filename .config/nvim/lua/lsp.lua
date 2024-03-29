-- VonHeikemen/lsp-zero.nvim
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["null-ls"] = {
      "go",
      "javascript",
      "lua",
      "sh",
      "typescript",
      "yaml",
    },
  },
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- lsp
--[[ local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  -- buf_set_keymap('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap("n", "<leader>st", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>sr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>sd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<leader>sl", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<leader>sa", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  vim.keymap.set("n", "<leader>FF", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities() ]]

-- Code actions
--[[ capabilities.textDocument.codeAction = {
  dynamicRegistration = true,
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = (function()
        local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
        table.sort(res)
        return res
      end)(),
    },
  },
}

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- bash, python and terraform
local nvim_lsp = require("lspconfig")
local servers = {
  "bashls",
  "pylsp",
  "terraformls",
  "tsserver",
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
 ]]

--[[ -- go
nvim_lsp.gopls.setup({
  cmd = { "gopls", "serve" },
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = false,
      },
      staticcheck = true,
    },
  },
})

--lua
require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}) ]]
