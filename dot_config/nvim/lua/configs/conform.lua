local options = {
  formatters_by_ft = {
    cue = { "cue_fmt" },
    fish = { "fish_indent" },
    go = { "gofmt" },
    hcl = { "terragrunt_hclfmt" },
    hujson = { "hujsonfmt" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    toml = { "taplo" },
  },

  formatters = {
    fish_indent = {
      condition = function(_, ctx)
        return not ctx.filename:match("%.tmpl$")
      end,
    },
    hujsonfmt = {
      command = "hujsonfmt",
      stdin = true,
    },
    shfmt = {
      prepend_args = { "-i", "2", "-ci", "-bn", "-ln", "bash" },
    },
    terragrunt_hclfmt = {
      condition = function(_, ctx)
        return vim.fs.root(ctx.dirname, { "terragrunt.hcl", "root.hcl" }) ~= nil
      end,
    },
  },

  format_on_save = function(bufnr)
    -- Language formatters cannot parse chezmoi's Go template syntax.
    if vim.api.nvim_buf_get_name(bufnr):match("%.tmpl$") then
      return
    end

    return {
      timeout_ms = 2000,
      lsp_format = "fallback",
    }
  end,
}

return options
