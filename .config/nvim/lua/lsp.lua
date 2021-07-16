local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>st', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>sr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>sd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '<leader>sl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<leader>sa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap('n', '<leader>FF', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap('n', '<leader>FF', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
capabilities.textDocument.codeAction = {
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
local nvim_lsp = require('lspconfig')
local servers = {
	'bashls',
	'pylsp',
	'terraformls',
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

-- go
nvim_lsp.gopls.setup({
	cmd = { 'gopls', 'serve' },
	on_attach = on_attach,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

--lua
sumneko_root_path = vim.loop.os_homedir() .. '/.local/share/lua-language-server'

if vim.fn.has('mac') then
	sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'
elseif vim.fn.has('unix') then
	sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
end

require('lspconfig').sumneko_lua.setup({
	cmd = {
		sumneko_binary,
		'-E',
		sumneko_root_path .. '/main.lua',
	},
	on_attach = on_attach,
	settings = {
		Lua = {
			completion = {
				keywordSnippet = 'Disable',
			},
			diagnostics = {
				globals = { 'vim', 'use' },
				disable = { 'lowercase-global' },
			},
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
	commands = {
		Format = {
			function()
				require('stylua-nvim').format_file()
			end,
		},
	},
})
