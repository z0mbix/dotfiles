-- bash
require('lspconfig').bashls.setup{
	on_attach = function(client)
		require 'illuminate'.on_attach(client)
	end,
}

-- terraform
require('lspconfig').terraformls.setup{
	on_attach = function(client)
		require 'illuminate'.on_attach(client)
	end,
}

-- python
require('lspconfig').pylsp.setup {
	on_attach = function(client)
		require 'illuminate'.on_attach(client)
	end,
}

-- go
require('lspconfig').gopls.setup {
	on_attach = function(client)
		require 'illuminate'.on_attach(client)
	end,
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

--lua
sumneko_root_path = vim.loop.os_homedir() .. '/.local/share/lua-language-server'

if vim.fn.has('mac') then
	sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"
elseif vim.fn.has('unix') then
	sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
end

require('lspconfig').sumneko_lua.setup {
	on_attach = function(client)
		require 'illuminate'.on_attach(client)
	end,
	cmd = {
		sumneko_binary,
		"-E",
		sumneko_root_path .. "/main.lua"
	},
	settings = {
		Lua = {
			completion = {
				keywordSnippet = "Disable",
			},
			diagnostics = {
				globals = {"vim", "use"},
				disable = {"lowercase-global"}
			},
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}
