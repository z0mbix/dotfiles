return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.ansiblelint,
        -- null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.hclfmt,
        null_ls.builtins.formatting.just,
        null_ls.builtins.formatting.packer,
        -- null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2", "-ci", "-bn", "-ln", "bash" } }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.yamlfmt,
      },

      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    })
  end,
}
